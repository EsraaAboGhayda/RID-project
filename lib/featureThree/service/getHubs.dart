import 'package:dio/dio.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:ride_project/core/config/core_service.dart';
import 'package:ride_project/core/config/handling_model.dart';
import 'package:ride_project/core/config/header_config.dart';
import 'package:ride_project/featureThree/model/UserLocationModel.dart';
import 'package:latlong2/latlong.dart';

class mapservice extends CoreService {
  // MapController mapController = MapController();
  // Future<void> setUserLocationOnMap(User_location_model userLocation) async {
  //   var mm = mapController.move(
  //       LatLng(userLocation.latitude, userLocation.longtitude), 15.0);
  // }

  Future<ResultModel> grtAllHub(User_location_model userLocation) async {
    try {
      response = await dio.post(
          "https://rideshare.devscape.online/api/v1/hubs?",
          data: userLocation.toMap(),
          options: HeaderConfig.getHeader(useToken: false));

      if (response.statusCode == 200) {
        return DataSuccess();
      } else {
        print("else");
        return ErrorModel();
      }
    } on DioException catch (e) {
      print(e.message);
      return ExceptionModel(message: e.message!);
    }
  }
}
