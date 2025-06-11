import 'package:clean_architecture_template/features/auth/domain/usecases/login_use_case.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  static AuthenticationBloc get(context) => BlocProvider.of(context);
  final LoginUseCase loginUseCase;
  AuthenticationBloc({required this.loginUseCase})
      : super(AuthenticationInitial()) {
    on<AuthenticationEvent>((event, emit) async {
      if (event is LoginEvent) {
        emit(LoginLoadingState());
        var result = await loginUseCase.call(
          event.userName,
          event.password,
          event.context,
        );
        result.fold(
          (failure) => emit(LoginErrorState(errorMessage: failure.message)),
          (success) => emit(LoginSucessState()),
        );
      }
    });
  }
}
