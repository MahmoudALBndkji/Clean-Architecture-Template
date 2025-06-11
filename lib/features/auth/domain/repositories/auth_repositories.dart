import 'package:clean_architecture_template/core/error/failures.dart';
import 'package:clean_architecture_template/features/auth/domain/entities/response_login_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

abstract class AuthRepository {
  Future<Either<Failure, ResponseLoginEntity>> login(
    String userNameOrEmailOrPhone,
    String password,
    BuildContext context,
  );
}
