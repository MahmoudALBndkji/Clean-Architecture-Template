import 'dart:io';

import 'package:clean_architecture_template/core/constants/constants.dart';
import 'package:clean_architecture_template/core/utils/assets.dart';
import 'package:flutter/material.dart';

customError() {
  return ErrorWidget.builder = ((details) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        height: double.infinity,
        color: Colors.black87,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40.0),
            Expanded(
              flex: 2,
              child: Image.asset(
                AssetsImage.notFound,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  Platform.localeName.substring(0, 2) == "ar"
                      ? "هناك خطأ ما"
                      : "Something is wrong",
                  // if you want to show main message error cancel comment below
                  // details.exception.toString(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: whiteColor,
                    fontSize: 18.0,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  });
}
