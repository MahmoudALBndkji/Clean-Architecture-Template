import 'package:clean_architecture_template/core/utils/typedef.dart';

abstract class Usecase<T> {
  FutureResult<T> call();
}

abstract class UsecaseWithParams<T, Params> {
  FutureResult<T> call(Params params);
}
