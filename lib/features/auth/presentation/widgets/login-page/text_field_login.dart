import 'package:clean_architecture_template/core/constants/constants.dart';
import 'package:clean_architecture_template/core/languages/app_localizations.dart';
import 'package:flutter/material.dart';

Widget textFieldLogin({
  required IconData icon,
  required String hintText,
  required bool isPassword,
  required BuildContext context,
  required TextEditingController controller,
}) {
  return Container(
    height: widthScreen(context) / 8,
    width: widthScreen(context) / 1.22,
    alignment: Alignment.center,
    padding: EdgeInsetsDirectional.only(start: widthScreen(context) / 30),
    decoration: BoxDecoration(
      color: Colors.black.withValues(alpha: .05),
      borderRadius: BorderRadius.circular(10),
    ),
    child: TextFormField(
      controller: controller,
      style: TextStyle(color: Colors.black.withValues(alpha: .8)),
      obscureText: isPassword,
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        suffixIcon: Icon(
          icon,
          color: Colors.black.withValues(alpha: .7),
        ),
        border: InputBorder.none,
        hintMaxLines: 1,
        hintText: hintText.tr(context),
        hintStyle:
            TextStyle(fontSize: 14, color: Colors.black.withValues(alpha: .5)),
      ),
    ),
  );
}
