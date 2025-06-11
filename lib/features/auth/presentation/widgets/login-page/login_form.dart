import 'package:clean_architecture_template/core/constants/constants.dart';
import 'package:clean_architecture_template/core/widgets/custom_circular_progress_indicator.dart';
import 'package:clean_architecture_template/core/widgets/snack_bar_message.dart';
import 'package:clean_architecture_template/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:clean_architecture_template/features/auth/presentation/widgets/login-page/language_selector.dart';
import 'package:clean_architecture_template/features/auth/presentation/widgets/login-page/login_button.dart';
import 'package:clean_architecture_template/features/auth/presentation/widgets/login-page/text_field_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthenticationBloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "Clean Arch Template",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black.withValues(alpha: .7),
          ),
        ),
        textFieldLogin(
          icon: Icons.account_circle_outlined,
          hintText: 'username',
          isPassword: false,
          context: context,
          controller: userNameController,
        ),
        textFieldLogin(
          icon: Icons.lock_outline,
          hintText: 'password',
          isPassword: true,
          context: context,
          controller: passwordController,
        ),
        BlocBuilder<AuthenticationBloc, AuthenticationState>(
          builder: (context, state) {
            return state is! LoginLoadingState
                ? loginButton(
                    'login',
                    2.5,
                    () {
                      if (userNameController.text.isEmpty) {
                        customSnackBar(
                          context: context,
                          keyLanguage: "username_validation",
                          backgroundColor: primaryColor,
                        );
                        return;
                      } else if (passwordController.text.isEmpty) {
                        customSnackBar(
                          context: context,
                          keyLanguage: "password_validation",
                          backgroundColor: primaryColor,
                        );
                        return;
                      }
                      HapticFeedback.lightImpact();
                      authBloc.add(
                        LoginEvent(
                          context: context,
                          userName: userNameController.text,
                          password: passwordController.text,
                        ),
                      );
                    },
                    context,
                  )
                : const CustomCircularProgressIndicator();
          },
        ),
        const LanguageSelector(),
      ],
    );
  }
}
