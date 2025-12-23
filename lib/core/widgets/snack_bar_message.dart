import 'package:flutter/material.dart';
import 'package:clean_architecture_template/core/utils/styles.dart';
import 'package:clean_architecture_template/core/constants/app_colors.dart';
import 'package:clean_architecture_template/core/languages/app_localizations.dart';

void customSnackBar(
        {required BuildContext context,
        required String keyLanguage,
        Color? backgroundColor = AppColors.primaryColor,
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
              keyLanguage.tr(),
              style:
                  TextStyles.textStyle16.copyWith(color: AppColors.whiteColor),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
