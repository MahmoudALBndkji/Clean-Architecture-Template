import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:clean_architecture_template/core/constants/constants.dart';
import 'package:clean_architecture_template/core/languages/app_localizations.dart';
import 'package:http/http.dart' as http;
import 'strings.dart';

abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
  factory ServerFailure.fromHttpException(http.ClientException e) {
    if (e is SocketException) {
      return ServerFailure(isArabic()
          ? ErrorMessageArabic.OfflineFailure
          : ErrorMessageEnglish.OfflineFailure);
    } else if (e is TimeoutException) {
      return ServerFailure(isArabic()
          ? ErrorMessageArabic.TimeoutFailure
          : ErrorMessageEnglish.TimeoutFailure);
    } else {
      return ServerFailure(isArabic()
          ? ErrorMessageArabic.GeneralFailure
          : ErrorMessageEnglish.GeneralFailure);
    }
  }
  factory ServerFailure.fromResponse(http.Response response) {
    switch (response.statusCode) {
      case StatusCodes.BAD_REQUEST:
      case StatusCodes.UNAUTHORIZED_USER:
      case StatusCodes.UNKNOWN_ERROR:
        final jsonResponse = json.decode(response.body);
        return ServerFailure(jsonResponse['error']['message']);
      case StatusCodes.NOT_FOUND:
        return ServerFailure(isArabic()
            ? ErrorMessageArabic.NotFoundFailure
            : ErrorMessageEnglish.NotFoundFailure);
      case StatusCodes.SERVER_ERROR:
        return ServerFailure(isArabic()
            ? ErrorMessageArabic.InteralServerFailure
            : ErrorMessageEnglish.InteralServerFailure);
      default:
        return ServerFailure(isArabic()
            ? ErrorMessageArabic.GeneralFailure
            : ErrorMessageEnglish.GeneralFailure);
    }
  }
}

class OfflineFailure extends Failure {
  OfflineFailure(super.message);
}

class EmptyCacheFailure extends Failure {
  EmptyCacheFailure(super.message);
}

class ServerException implements Exception {
  final String message;
  ServerException({required this.message});
}
