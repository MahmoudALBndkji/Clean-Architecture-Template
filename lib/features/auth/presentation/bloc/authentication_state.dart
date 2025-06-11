part of 'authentication_bloc.dart';

abstract class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

final class LoginLoadingState extends AuthenticationState {}

final class LoginErrorState extends AuthenticationState {
  final String errorMessage;

  LoginErrorState({required this.errorMessage});
}

final class LoginSucessState extends AuthenticationState {}
