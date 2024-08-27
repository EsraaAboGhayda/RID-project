import 'package:dio/dio.dart';
import 'package:ride_project/core/config/get_it_config.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/config/header_config.dart';
import '../../../../core/config/handling_model.dart';
import '../model/login_model.dart';
import '../model/signup_model.dart';
import '../../../../core/config/core_service.dart';

abstract class AuthService extends CoreService {
  Future<ResultModel> signUp(SingUpModel user);
  Future<ResultModel> logIn(LoginModel user);
}

class AuthSeviceImp extends AuthService {
  @override
  Future<ResultModel> signUp(SingUpModel user) async {
    try {
      print('fghjkjjjjjjjjjjjjjjjjjjl');
      print(user.toJson());

      response = await dio.post(
          "https://rideshare.devscape.online/api/v1/auth/register",
          data: user.toJson());
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
        return ErrorModel(message: "");
      }
    } on DioException catch (e) {
      print(e.response!.data.toString());
      return ExceptionModel(message: e.response!.data.toString());
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
        return ErrorModel(message: "");
      }
    } on DioException catch (e) {
      return ExceptionModel(message: e.message!);
    }
  }
}
