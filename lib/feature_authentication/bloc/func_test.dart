// import 'package:flutter_test/flutter_test.dart';
// import 'package:meta/meta.dart';

// import '../../features/feature_authentication/bloc/authe_bloc.dart';

// @visibleForTesting
// void testbloc(singUpModel, singUpModelError, loginModel, loginModelError) {
//   late AutheBloc autheBloc;

//   setUp(() {
//     autheBloc = AutheBloc();
//   });

//   group("signup", () {
//     blocTest<AutheBloc, AutheState>(
//         "should emit [AuthLoading,AuthSuccess] when data is gotten successfully",
//         build: () => autheBloc,
//         act: (bloc) => bloc.add(Register(user: singUpModel)),
//         expect: () => [isA<Loading>(), isA<SuccessToRegister>()]);

//     blocTest<AutheBloc, AutheState>(
//         "should emit [AuthLoading,AuthError] when data is gotten unsuccessfully",
//         build: () => autheBloc,
//         act: (bloc) => bloc.add(Register(user: singUpModelError)),
//         expect: () => [isA<Loading>(), isA<Failed>()]);
//   });

//   group("login", () {
//     blocTest<AutheBloc, AutheState>(
//         "should emit [AuthLoading,AuthSuccess] when data is gotten successfully",
//         build: () => autheBloc,
//         act: (bloc) => bloc.add(LogIn(user: loginModel)),
//         expect: () => [isA<Loading>(), isA<SuccessToRegister>()]);

//     blocTest<AutheBloc, AutheState>(
//         "should emit [AuthLoading,AuthError] when data is gotten unsuccessfully",
//         build: () => autheBloc,
//         act: (bloc) => bloc.add(LogIn(user: loginModelError)),
//         expect: () => [isA<Loading>(), isA<Failed>()]);
//   });
// }
