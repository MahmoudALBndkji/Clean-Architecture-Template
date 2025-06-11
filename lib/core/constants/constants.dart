import 'package:flutter/material.dart';

class RemoteConstants {
  static const String BASE_URL = "https://baseurl.example.com";
}

class Endpoints {
  static const String Login = 'User/Login';
}

class StatusCodes {
  static const SUCCESS = 200;
  static const SUCCESS_WITH_RESULT = 201;
  static const BAD_REQUEST = 400;
  static const UNAUTHORIZED_USER = 401;
  static const UNKNOWN_ERROR = 402;
  static const NOT_FOUND = 404;
  static const UNVERIFIED_ACCOUNT = 406;
  static const EXPIRED_TOKEN = 434;
  static const MUST_LOGIN_AGAIN = 436;
  static const SERVER_ERROR = 500;
  static const NETWORK_ERROR = 0;
}

const primaryColor = Color(0xFF3884C2);
const whiteColor = Colors.white;
const blackColor = Colors.black;
const cancelledColor = Color(0xffDB4437);

// Full Size Dimensions

double heightScreen(context) => MediaQuery.sizeOf(context).height;
double widthScreen(context) => MediaQuery.sizeOf(context).width;
