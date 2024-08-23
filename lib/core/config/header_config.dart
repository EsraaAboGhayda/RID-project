import 'package:dio/dio.dart';
import 'package:ride_project/core/config/get_it_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HeaderConfig {
  static Options getHeader({useToken = true}) {
    if (useToken) {
      return Options(headers: {
        "accept": "*/*",
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI4ODg4ODk5OTk5IiwiaWF0IjoxNzI0MTY5NjA1LCJleHAiOjE3MjQyNTYwMDV9.ORyH2M6eoRioijgR9Xq_QCL63gZbloBVzXRhgSfweYE"
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
