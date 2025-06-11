import 'package:clean_architecture_template/core/constants/constants.dart';
import 'package:clean_architecture_template/core/languages/app_localizations.dart';
import 'package:clean_architecture_template/core/utils/styles.dart';
import 'package:flutter/material.dart';

void customSnackBar(
        {required BuildContext context,
        required String keyLanguage,
        Color? backgroundColor = primaryColor,
        EdgeInsets? margin = const EdgeInsets.all(8.0)}) =>
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        margin: margin,
        backgroundColor: backgroundColor,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              keyLanguage.tr(context),
              style: TextStyles.textStyle16.copyWith(color: whiteColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
