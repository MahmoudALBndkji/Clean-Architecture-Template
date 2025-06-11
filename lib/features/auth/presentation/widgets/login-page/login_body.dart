import 'package:clean_architecture_template/core/constants/constants.dart';
import 'package:clean_architecture_template/core/languages/app_localizations.dart';
import 'package:clean_architecture_template/core/network/local/cache_helper.dart';
import 'package:clean_architecture_template/core/utils/assets.dart';
import 'package:clean_architecture_template/core/widgets/navigation.dart';
import 'package:clean_architecture_template/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:clean_architecture_template/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'biometric_button.dart';
import 'login_form.dart';
import 'my_scroll_behavior.dart';
import 'package:quickalert/quickalert.dart';

class LoginBody extends StatelessWidget {
  final Animation<double> opacity;
  final Animation<double> transform;

  const LoginBody({super.key, required this.opacity, required this.transform});

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: MyBehavior(),
      child: SingleChildScrollView(
        child: SizedBox(
          height: heightScreen(context),
          child: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 32, 103, 150),
                  Color.fromARGB(255, 15, 103, 161),
                  Color.fromARGB(255, 13, 68, 105),
                ],
              ),
            ),
            child: Opacity(
              opacity: opacity.value,
              child: Transform.scale(
                scale: transform.value,
                child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
                  listener: (context, state) {
                    if (state is LoginErrorState) {
                      QuickAlert.show(
                        barrierDismissible: false,
                        context: context,
                        type: QuickAlertType.error,
                        title: "error".tr(context),
                        confirmBtnText: "done".tr(context),
                        text: state.errorMessage,
                        animType: QuickAlertAnimType.slideInDown,
                      );
                    } else if (state is LoginSucessState) {
                      QuickAlert.show(
                        barrierDismissible: false,
                        context: context,
                        type: QuickAlertType.success,
                        title: "operation_success".tr(context),
                        confirmBtnText: "done".tr(context),
                        text: "login_successfully".tr(context),
                        animType: QuickAlertAnimType.slideInDown,
                      );
                      Future.delayed(const Duration(milliseconds: 500), () {
                        CacheHelper.saveData(key: "isLogin", value: true);
                        Navigator.pop(context);
                        navigateAndRemoveUntil(context, const HomePage());
                      });
                    }
                  },
                  builder: (context, state) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(25.0),
                            child: Image.asset(
                              AssetsImage.logo,
                              width: widthScreen(context) / 2,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        Container(
                          width: widthScreen(context) * .9,
                          height: widthScreen(context) * 1.1,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.1),
                                blurRadius: 90,
                              ),
                            ],
                          ),
                          child: LoginForm(),
                        ),
                        if (CacheHelper.getData(key: "showBiometric") ==
                            true) ...{
                          const SizedBox(height: 20.0),
                          const BiometricButton(),
                        },
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
