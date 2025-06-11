import 'package:clean_architecture_template/core/constants/constants.dart';
import 'package:clean_architecture_template/core/utils/styles.dart';
import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        animation: slidingAnimation,
        builder: (context, _) => SlideTransition(
          position: slidingAnimation,
          child: Text(
            "Clean Architecture Template",
            textAlign: TextAlign.center,
            style: TextStyles.textStyle20.copyWith(color: primaryColor),
          ),
        ),
      );
}
