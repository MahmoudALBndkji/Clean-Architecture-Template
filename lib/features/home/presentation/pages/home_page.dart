import 'package:clean_architecture_template/core/constants/constants.dart';
import 'package:clean_architecture_template/core/languages/app_localizations.dart';
import 'package:clean_architecture_template/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Text(
          "home_page".tr(context),
          style: TextStyles.textStyle16,
        ),
        elevation: 1.0,
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          "home_page".tr(context),
          style: TextStyles.textStyle20,
        ),
      ),
    );
  }
}
