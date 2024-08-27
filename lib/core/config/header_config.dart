import 'package:dio/dio.dart';
import 'package:ride_project/core/config/get_it_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HeaderConfig {
  static Options getHeader({useToken = true}) {
    if (useToken) {
      return Options(headers: {
        "accept": "*/*",
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiIxNTkyNjM3ODQ3IiwiaWF0IjoxNzI0NjQ5MTIxLCJleHAiOjE3MjQ3MzU1MjF9.8umPPAjCVMi7gE6yQg7VnNu81sfnH1C2j6zja3fQytk"
        // "Bearer${(core.get<SharedPreferences>().getString('token'))}"
      });
    } else {
      return Options(
        headers: {
          "Content-Type": "application/json",
        },
      );
    }
  }
}
