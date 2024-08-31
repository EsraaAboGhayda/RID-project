import 'package:flutter_test/flutter_test.dart';
import 'package:ride_project/features/feature_authentication/model/login_model.dart';

void main() {
  LoginModel loginModel = LoginModel(
    phone: 'phone',
    password: 'password!!',
  );

  test("return a json map", () async {
    final res = loginModel.toMap();
    final expextedJsonMap = {
      'phone': 'phone',
      'password': 'password!!',
    };
    expect(res, expextedJsonMap);
  });
}
