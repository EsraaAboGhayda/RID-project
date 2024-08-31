import 'package:dio/dio.dart';
import 'package:ride_project/core/config/get_it_config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HeaderConfig {
  static Options getHeader({useToken = true}) {
    if (useToken) {
      return Options(headers: {
        "accept": "*/*",
        "Authorization":
            "Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI3ODk2NTM0ODc5IiwiaWF0IjoxNzI1MDkzOTMxLCJleHAiOjE3MjUxODAzMzF9.9QuMHSMJef2ISS6OaQiT11jGpciRUbEetcg4LMz9SYU"
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
