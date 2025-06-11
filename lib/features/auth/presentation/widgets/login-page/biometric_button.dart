import 'package:clean_architecture_template/core/network/local/cache_helper.dart';
import 'package:clean_architecture_template/core/utils/assets.dart';
import 'package:clean_architecture_template/core/widgets/snack_bar_message.dart';
import 'package:clean_architecture_template/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';

class BiometricButton extends StatelessWidget {
  const BiometricButton({super.key});

  Future<void> _authenticate(BuildContext context) async {
    final auth = LocalAuthentication();
    final bool canAuthenticate = await auth.canCheckBiometrics;
    if (!canAuthenticate) {
      customSnackBar(
          context: context, keyLanguage: "device_does_not_support_biometric");
      return;
    }

    try {
      final isAuthenticated = await auth.authenticate(
        localizedReason: 'Please authenticate to proceed',
      );
      if (isAuthenticated) {
        BlocProvider.of<AuthenticationBloc>(context).add(LoginEvent(
          context: context,
          userName: CacheHelper.getData(key: "userName"),
          password: CacheHelper.getData(key: "password"),
        ));
      } else {
        customSnackBar(context: context, keyLanguage: "authentication_failed");
      }
    } catch (e) {
      debugPrint("Biometric error: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _authenticate(context),
      child: Image.asset(AssetsImage.biometic, width: 60),
    );
  }
}
