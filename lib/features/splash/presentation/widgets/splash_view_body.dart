import 'package:clean_architecture_template/core/utils/assets.dart';
import 'package:clean_architecture_template/core/widgets/navigation.dart';
import 'package:clean_architecture_template/features/auth/presentation/bloc/authentication_bloc.dart';
import 'package:clean_architecture_template/features/auth/presentation/pages/login_page.dart';
import 'package:clean_architecture_template/features/splash/presentation/widgets/sliding_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture_template/core/services/injection_container.dart'
    as di;

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigateToLogin();
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          AssetsImage.logo,
          fit: BoxFit.contain,
          width: widthScreen / 2,
          height: widthScreen / 1.5,
        ),
        const SizedBox(height: 30.0),
        SlidingText(slidingAnimation: slidingAnimation),
      ],
    );
  }

  void initSlidingAnimation() {
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    slidingAnimation = Tween<Offset>(
      begin: const Offset(0, 10),
      end: Offset.zero,
    ).animate(animationController);
    animationController.forward();
  }

  void navigateToLogin() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        Navigator.pushReplacement(
          context,
          SizeTransitionToTop(
            BlocProvider(
              create: (context) => di.sl<AuthenticationBloc>(),
              child: LoginPage(),
            ),
          ),
        );
      },
    );
  }
}
