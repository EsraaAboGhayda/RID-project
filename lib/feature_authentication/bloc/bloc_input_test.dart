import '../../features/feature_authentication/model/login_model.dart';
import '../../features/feature_authentication/model/signup_model.dart';
import 'func_test.dart';

void main() {
  SingUpModel singUpModel = SingUpModel(
      firstName: 'firstName',
      lastName: 'lastName',
      phone: '9087875181',
      birthDate: DateTime(2000, 12, 1),
      username: 'wfdvfewczbd2',
      password: 'passwordAA123!!',
      confirmPassword: 'passwordAA123!!');
  SingUpModel singUpModelError = SingUpModel(
      firstName: 'firstName',
      lastName: 'lastName',
      phone: '9087875181',
      birthDate: DateTime(2000, 12, 1),
      username: 'wfdvfewczbd2',
      password: 'password',
      confirmPassword: 'password');

  LoginModel loginModel = LoginModel(
    phone: '9092257241',
    password: 'passwordAA123!!',
  );
  LoginModel loginModelError = LoginModel(
    phone: '909225724',
    password: 'passwordAA123',
  );
  // testbloc(singUpModel, singUpModelError, loginModel, loginModelError);
}
