import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ride_project/core/config/handling_model.dart';

import '../../feature_map/model/HubModel.dart';
import '../model/bicycle_category.dart';
import '../service/service_transport.dart';

class HubCategoryParams {
  final BicycleCategoryModel category;
  final HubModel hub;

  HubCategoryParams(this.category, this.hub);
}

final Transport_provider_service = Provider<TranspoetSeviceImp>((ref) {
  return TranspoetSeviceImp();
});

final Transport_provider_GetBicycleCategory =
    FutureProvider<ResultModel>((ref) {
  return ref.read(Transport_provider_service).GetBicycleCategory();
});

final map_provider_GetBicycleByCategory =
    FutureProvider.family<ResultModel, BicycleCategoryModel>(
        (ref, namecategory) {
  return ref
      .read(Transport_provider_service)
      .GetBicycleByCategory(namecategory);
});

final map_provider_GetHubContent =
    FutureProvider.family<ResultModel, HubCategoryParams>((ref, params) {
  return ref
      .read(Transport_provider_service)
      .GetHubContent(params.category, params.hub);
});
