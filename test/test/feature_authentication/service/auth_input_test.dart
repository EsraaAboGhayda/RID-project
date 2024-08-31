import 'package:ride_project/features/feature_authentication/model/login_model.dart';
import 'package:ride_project/features/feature_authentication/model/signup_model.dart';

import 'func_test.dart';

void main() {
  SingUpModel singUpModel = SingUpModel(
      firstName: 'firstName',
      lastName: 'lastName',
      phone: '7848596748',
      birthDate: DateTime(2000, 12, 1),
      username: 'rdesaw',
      password: 'passwordAA123!!',
      confirmPassword: 'passwordAA123!!');

  LoginModel loginModel = LoginModel(
    phone: '9092257241',
    password: 'passwordAA123!!',
  );

  LoginModel loginModelError = LoginModel(
    phone: '909225724',
    password: 'passwordAA123',
  );
  testAuth(singUpModel, loginModel, loginModelError);
}
