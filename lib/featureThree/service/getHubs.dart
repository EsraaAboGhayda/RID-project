import 'package:dio/dio.dart';
import 'package:ride_project/core/config/core_service.dart';
import 'package:ride_project/core/config/handling_model.dart';

class mapservice extends CoreService {
  Future<ResultModel> grtAllHub() async {
    try {
      response = await dio.get(
          "https://rideshare.devscape.online/api/v1/hubs?longtitude=36.278336&latitude=33.510414");
      var hub = response.data;
      // options: getHeader(useToken: false)

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
