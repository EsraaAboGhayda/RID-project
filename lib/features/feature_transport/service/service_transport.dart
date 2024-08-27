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
  // ===============================22222222222222222222222222222222222

  Future<ResultModel> GetBicycleByCategory(String namecategory) async {
    try {
      final response = await dio.get(
        '$baseurl/bicycle/bicycles-by-category?category=$namecategory',
        options: HeaderConfig.getHeader(useToken: true),
      );

      if (response.statusCode == 200) {
        List<BicycleByCategoryModel> bicyclesByCategories =
            (response.data['body'] as List)
                .map((item) => BicycleByCategoryModel.fromMap(item))
                .toList();

        return ListOf<BicycleByCategoryModel>(
            resutlAsList: bicyclesByCategories);
      } else {
        return ErrorModel(
            message: 'Failed to fetch data: Status ${response.statusCode}');
      }
    } catch (e) {
      return ExceptionModel(message: 'Unexpected error: ${e.toString()}');
    }
  }

  // ==============1111111111111111111111111111111
  // @override
  // ignore: non_constant_identifier_names
  // Future<ResultModel> GetBicycleByCategory(namecategory) async {
  //   try {
  //     response = await dio.get(
  //         '$baseurl/bicycle/bicycles-by-category?category=${namecategory}',

  //         // baseurl +
  //         //     "/bicycle/bicycles-by-category?category=${namecategory.body}",
  //         options: HeaderConfig.getHeader(useToken: true));
  //     print(response.data);
  //     if (response.statusCode == 200) {
  //       // List<BicycleByCategoryModel> BicyclesByCategories =
  //       //     (response.data['body'] as List)
  //       //         .map((item) => BicycleByCategoryModel.fromJson(item))
  //       //         .toList();
  //       print("rrrrrrrrrrrrrrrrrrrrrrrrr${ListOf(resutlAsList: List.generate(
  //         response.data['body'].length,
  //         (index) => BicycleByCategoryModel.fromJson(response.data['body']),
  //       ))}");

  //       List<BicycleByCategoryModel> BicyclesByCategories = List.generate(
  //           response.data['body'].length, (index) => response.data['body']);

  //       // List<BicycleByCategoryModel> BicyclesByCategories = List.generate(
  //       //   response.data.length,
  //       //   (index) => BicycleByCategoryModel.fromJson(response.data[index]),
  //       // );

  //       print("mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm${BicyclesByCategories}");
  //       // return ListOf(
  //       //     resutlAsList: List.generate(
  //       //   response.data['body'].length,
  //       //   (index) =>
  //       //       BicycleByCategoryModel.fromMap(response.data['body'][index]),
  //       // ));
  //       return ListOf<BicycleByCategoryModel>(
  //           resutlAsList: BicyclesByCategories);
  //     } else {
  //       return ErrorModel(message: 'error');
  //     }
  //   } on DioException catch (e) {
  //     print(e.message);
  //     return ExceptionModel(message: e.message!);
  //   }
  // }
  // ======================================================================

  // @override
  Future<ResultModel> GetBicycleCategory() async {
    try {
      response = await dio.get(baseurl + "/bicycle/bicycles-categories",
          options: HeaderConfig.getHeader(useToken: true));
      if (response.statusCode == 200) {
        List<String> BicyclesCategories = List.generate(
            response.data['body'].length,
            (index) => response.data['body'][index]
            // BicycleCategoryModel.fromJson(response.data['body'][index]),
            );
        print(BicyclesCategories);
        // return DataSuccess();
        return ListOf<String>(resutlAsList: BicyclesCategories);
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
