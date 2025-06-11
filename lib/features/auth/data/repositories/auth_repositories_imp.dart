import 'package:clean_architecture_template/core/error/failures.dart';
import 'package:clean_architecture_template/core/error/strings.dart';
import 'package:clean_architecture_template/core/languages/app_localizations.dart';
import 'package:clean_architecture_template/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:clean_architecture_template/features/auth/domain/entities/response_login_entity.dart';
import 'package:clean_architecture_template/features/auth/domain/repositories/auth_repositories.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthRepositoryImp implements AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;
  AuthRepositoryImp({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, ResponseLoginEntity>> login(
    String userName,
    String password,
    BuildContext context,
  ) async {
    try {
      ResponseLoginEntity agentLogin;
      agentLogin =
          await authRemoteDataSource.loginAgent(userName, password, context);
      return Right(agentLogin);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on http.ClientException catch (e) {
      return Left(ServerFailure.fromHttpException(e));
    } catch (e) {
      return Left(
        ServerFailure(
          isArabic()
              ? ErrorMessageArabic.GeneralFailure
              : ErrorMessageEnglish.GeneralFailure,
        ),
      );
    }
  }
}
