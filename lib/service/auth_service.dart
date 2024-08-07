
import 'package:dio/dio.dart';
import 'package:ride_project/core/config/get_it_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/config/header_config.dart';
import '../core/config/handling_model.dart';
import '../model/login_model.dart';
import '../model/signup_model.dart';
import 'core_service.dart';

abstract class AuthService extends CoreService {
  Future<ResultModel> signUp(SingUpModel user);
  Future<ResultModel> logIn(LoginModel user);
}

class AuthSeviceImp extends AuthService {
  @override
  Future<ResultModel> signUp(SingUpModel user) async {
    try {
      print('fghjkjjjjjjjjjjjjjjjjjjl');
      print(user.toMap());

      response = await dio.post(
          "https://rideshare.devscape.online/api/v1/auth/register",
          data: user.toMap());
      print('fghjkj00000000jjjjjjjjjjjjjjjjjl');

      if (response.statusCode == 200) {
// var box = Hive.box<AuthenticationToken>('authBox');
// box.put('tokenKey', AuthenticationToken('YOUR_TOKEN_HERE'));
// var storedToken = box.get('tokenKey');
// print(storedToken?.token);
        String token = response.data['body']['token'];
        core.get<SharedPreferences>().setString('token', token);
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

  @override
  Future<ResultModel> logIn(LoginModel user) async {
    try {
      response = await dio.post(baseurl + "/auth/authenticate",
          data: user.toMap(), options: HeaderConfig.getHeader());
      if (response.statusCode == 200) {
        return DataSuccess();
      } else {
        return ErrorModel();
      }
    } on DioException catch (e) {
      return ExceptionModel(message: e.message!);
    }
  }
}
