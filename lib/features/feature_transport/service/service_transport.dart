import 'package:dio/dio.dart';

import '../../../core/config/core_service.dart';
import '../../../core/config/handling_model.dart';
import '../../../core/config/header_config.dart';
import '../../feature_map/model/HubModel.dart';
import '../model/bicycle_by_category.dart';
import '../model/bicycle_category.dart';
import '../model/hub_content.dart';

// abstract class TranspoetService extends CoreService {
//   Future<ResultModel> GetBicycleCategory();
//   Future<ResultModel> GetBicycleByCategory(BicycleCategoryModel namecategory);
//   Future<ResultModel> GetHubContent(
//       BicycleCategoryModel namecategory, HubModel hubid);
// }

class TranspoetSeviceImp extends CoreService {
  // @override
  Future<ResultModel> GetBicycleByCategory(
      BicycleCategoryModel namecategory) async {
    try {
      response = await dio.get(
          baseurl +
              "/bicycle/bicycles-by-category?category=${namecategory.body}",
          options: HeaderConfig.getHeader(useToken: true));
      if (response.statusCode == 200) {
        List<BicycleByCategoryModel> BicyclesByCategories = List.generate(
          response.data.length,
          (index) => BicycleByCategoryModel.fromJson(response.data[index]),
        );
        return ListOf<BicycleByCategoryModel>(
            resutlAsList: BicyclesByCategories);
      } else {
        return ErrorModel(message: '');
      }
    } on DioException catch (e) {
      print(e.message);
      return ExceptionModel(message: e.message!);
    }
  }

  // @override
  Future<ResultModel> GetBicycleCategory() async {
    try {
      response = await dio.get(baseurl + "/bicycle/bicycles-categories",
          options: HeaderConfig.getHeader(useToken: true));
      if (response.statusCode == 200) {
        List<BicycleCategoryModel> BicyclesCategories = List.generate(
          response.data['body'].length,
          (index) =>
              BicycleCategoryModel.fromJson(response.data['body'][index]),
        );
        return ListOf<BicycleCategoryModel>(resutlAsList: BicyclesCategories);
      } else {
        return ErrorModel(message: '');
      }
    } on DioException catch (e) {
      print(e.message);
      return ExceptionModel(message: e.message!);
    }
  }

  // @override
  Future<ResultModel> GetHubContent(
      BicycleCategoryModel namecategory, HubModel hubid) async {
    try {
      response = await dio.get(
          baseurl +
              "/hub-content/${hubid.id}?bicycleCategory=${namecategory.body}",
          options: HeaderConfig.getHeader(useToken: true));
      if (response.statusCode == 200) {
        List<HubContentModel> HubContent = List.generate(
          response.data.length,
          (index) => HubContentModel.fromJson(response.data[index]),
        );
        return ListOf<HubContentModel>(resutlAsList: HubContent);
      } else {
        return ErrorModel(message: '');
      }
    } on DioException catch (e) {
      print(e.message);
      return ExceptionModel(message: e.message!);
    }
  }
}
