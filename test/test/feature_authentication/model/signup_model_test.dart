import 'package:flutter_test/flutter_test.dart';
import 'package:ride_project/features/feature_authentication/model/signup_model.dart';

void main() {
  SingUpModel singUpModel = SingUpModel(
      firstName: 'firstName',
      lastName: 'lastName',
      phone: 'phone',
      birthDate: DateTime(2000, 12, 1),
      username: 'username',
      password: 'password!!',
      confirmPassword: 'confirmPassword!!');

  test("return a json map", () async {
    final res = singUpModel.toJson();
    final expextedJsonMap = {
      'firstName': 'firstName',
      'lastName': 'lastName',
      'phone': 'phone',
      'birthDate': '2000-12-01',
      'username': 'username',
      'password': 'password!!',
      'confirmPassword': 'confirmPassword!!'
    };
    expect(res, expextedJsonMap);
  });
}
