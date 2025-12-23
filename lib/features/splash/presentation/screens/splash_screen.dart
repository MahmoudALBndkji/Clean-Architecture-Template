import 'package:flutter/material.dart';
import 'package:clean_architecture_template/core/constants/app_colors.dart';
import 'package:clean_architecture_template/features/splash/presentation/widgets/splash_view_body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) => const Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: SplashViewBody(),
      );
}
