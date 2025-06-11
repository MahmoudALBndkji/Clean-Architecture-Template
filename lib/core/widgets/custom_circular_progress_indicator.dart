import 'package:clean_architecture_template/core/constants/constants.dart';
import 'package:flutter/material.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({super.key});
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(
        valueColor: AlwaysStoppedAnimation<Color>(
          primaryColor,
        ),
      ),
    );
  }
}
