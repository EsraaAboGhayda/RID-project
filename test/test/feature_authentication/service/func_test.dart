import 'package:flutter_test/flutter_test.dart';
import 'package:meta/meta.dart';
import 'package:ride_project/core/config/handling_model.dart';
import 'package:ride_project/features/feature_authentication/service/auth_service.dart';

@visibleForTesting
void testAuth(singUpModel, loginModel, loginModelError) {
  late AuthSeviceImp authSeviceImp;

  setUp(() {
    authSeviceImp = AuthSeviceImp();
  });

  group("signUp", () {
    test("return true when the response code is 200", () async {
      final res = await authSeviceImp.signUp(singUpModel);
      expect(res, isA<DataSuccess>());
    });

    test("return dio exception when the response code is 400", () async {
      final res = await authSeviceImp.signUp(singUpModel);
      expect(res, isA<ExceptionModel>());
    });
  });

  group("login", () {
    test("return true when the response code is 200", () async {
      final res = await authSeviceImp.logIn(loginModel);
      expect(res, isA<DataSuccess>());
    });

    test("return dio exception when the response code is 400", () async {
      final res = await authSeviceImp.logIn(loginModelError);
      expect(res, isA<ExceptionModel>());
    });
  });
}
