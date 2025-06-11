import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:clean_architecture_template/core/error/failures.dart';
import 'package:clean_architecture_template/features/auth/domain/entities/response_login_entity.dart';
import 'package:clean_architecture_template/features/auth/domain/repositories/auth_repositories.dart';

class LoginUseCase {
  final AuthRepository repository;
  LoginUseCase({required this.repository});

  Future<Either<Failure, ResponseLoginEntity>> call(
      String userName, String password, BuildContext context) async {
    return await repository.login(
      userName,
      password,
      context,
    );
  }
}
