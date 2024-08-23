part of 'authe_bloc.dart';

@immutable
sealed class AutheEvent {}

class Register extends AutheEvent {
  final SingUpModel user;
  Register({
    required this.user,
  });
}

class LogIn extends AutheEvent {
  final LoginModel user;
  LogIn({
    required this.user,
  });
}
