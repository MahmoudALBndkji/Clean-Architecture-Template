import 'dart:convert';
import 'package:clean_architecture_template/core/constants/constants.dart';
import 'package:clean_architecture_template/core/error/display_error_message.dart';
import 'package:clean_architecture_template/core/error/failures.dart';
import 'package:clean_architecture_template/core/network/local/cache_helper.dart';
import 'package:clean_architecture_template/core/services/api_service.dart';
import 'package:clean_architecture_template/features/auth/data/models/response_login_model.dart';
import 'package:clean_architecture_template/features/auth/domain/entities/response_login_entity.dart';
import 'package:flutter/material.dart';

abstract class AuthRemoteDataSource {
  Future<ResponseLoginEntity> loginAgent(
    String userName,
    String password,
    BuildContext context,
  );
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiService service;
  AuthRemoteDataSourceImpl({required this.service});
  @override
  Future<ResponseLoginEntity> loginAgent(
    String userName,
    String password,
    BuildContext context,
  ) async {
    String url = Endpoints.Login;
    final response = await service.requestApi(
      context: context,
      requestType: RequestType.POST,
      endPoint: url,
      parameter: {"UserName": userName, "Password": password},
    );
    ResponseLoginEntity userLogin =
        ResponseLoginModel.fromJson(jsonDecode(response.body));
    if (userLogin.data != null && response.statusCode == 200) {
      if (userLogin.data!.userID != null) {
        CacheHelper.saveData(key: "userId", value: userLogin.data!.userID);
        CacheHelper.saveData(key: "accessToken", value: userLogin.data!.token);
        CacheHelper.saveData(key: "password", value: password);
      }
    } else {
      final errorMessage = displayErrorMessage(response.body, context);

      throw ServerException(message: errorMessage);
    }
    return userLogin;
  }
}
