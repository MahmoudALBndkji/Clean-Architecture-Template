import 'dart:convert';
import 'package:clean_architecture_template/core/languages/app_localizations.dart';
import 'package:flutter/material.dart';

String displayErrorMessage(String body, BuildContext context) {
  if (body.isEmpty) return "error".tr(context);

  try {
    final decoded = jsonDecode(body);
    if (decoded is Map) {
      if (decoded["Message"] != null) {
        return decoded["Message"].toString();
      } else if (decoded["error"] != null) {
        return decoded["error"].toString();
      }
    }
  } catch (e) {
    debugPrint("Error parsing response body: $e");
  }

  return body.toString();
}
