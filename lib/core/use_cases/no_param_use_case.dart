import 'package:clean_architecture_template/core/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class CustomUseCase<Type> {
  Future<Either<Failure, Type>> call();
}
