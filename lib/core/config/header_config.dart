import 'package:dio/dio.dart';
import 'package:ride_project/core/config/get_it_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HeaderConfig {
  static Options getHeader({useToken = true}) {
    if (useToken) {
      return Options(headers: {
        "accept": "*/*",
        "Authorization":
            // "Bearer${(core.get<SharedPreferences>().getString('token'))}"
            "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI4NTI3NDk2MzQ3IiwiaWF0IjoxNzI1MDc5MzU1LCJleHAiOjE3MjUxNjU3NTV9.glAsMrIqNmAHKfz51o1S7EL6eTJ8bYFjEtqzTgSuZzs"
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
