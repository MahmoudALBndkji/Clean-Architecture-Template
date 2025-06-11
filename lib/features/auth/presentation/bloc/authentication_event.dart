part of 'authentication_bloc.dart';

abstract class AuthenticationEvent {}

class LoginEvent extends AuthenticationEvent {
  final BuildContext context;
  final String userName;
  final String password;

  LoginEvent({
    required this.context,
    required this.userName,
    required this.password,
  });
}
