import 'package:clean_architecture_template/core/constants/constants.dart';
import 'package:clean_architecture_template/core/languages/app_localizations.dart';
import 'package:flutter/material.dart';

Widget loginButton(
  String string,
  double width,
  VoidCallback voidCallback,
  BuildContext context,
) {
  return InkWell(
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    onTap: voidCallback,
    child: Container(
      height: widthScreen(context) / 9,
      width: widthScreen(context) / width,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        string.tr(context),
        style: const TextStyle(color: whiteColor, fontWeight: FontWeight.w600),
      ),
    ),
  );
}
