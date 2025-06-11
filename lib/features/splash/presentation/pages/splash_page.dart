import 'package:clean_architecture_template/core/constants/constants.dart';
import 'package:clean_architecture_template/features/splash/presentation/widgets/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        backgroundColor: whiteColor,
        body: SplashViewBody(),
      );
}
