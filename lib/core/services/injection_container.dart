import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:clean_architecture_template/core/services/api/dio_consumer.dart';
import 'package:clean_architecture_template/core/services/api/api_consumer.dart';
import 'package:clean_architecture_template/core/services/api/app_interceptors.dart';
import 'package:clean_architecture_template/core/languages/cubit/language_cubit.dart';
import 'package:clean_architecture_template/features/users/domain/repos/users_repository.dart';
import 'package:clean_architecture_template/features/users/data/repos/user_repository_impl.dart';
import 'package:clean_architecture_template/features/users/data/datasources/user_data_source.dart';
import 'package:clean_architecture_template/features/users/presentation/cubits/user/user_cubit.dart';
import 'package:clean_architecture_template/features/users/domain/usecases/get_all_users_use_case.dart';
import 'package:clean_architecture_template/features/users/data/datasources/user_remote_data_source.dart';
import 'package:clean_architecture_template/features/users/domain/usecases/get_user_details_use_case.dart';

final sl = GetIt.instance;
Future<void> initServiceLocator() async {
  sl.registerFactory(() => LanguageCubit());

  sl.registerFactory(
      () => UserCubit(getAllUsersUseCase: sl(), getUserDetailsUseCase: sl()));
  sl.registerLazySingleton(() => GetAllUsersUseCase(sl()));
  sl.registerLazySingleton(() => GetUserDetailsUseCase(sl()));
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(sl()));
  sl.registerLazySingleton<UserDataSource>(() => UserRemoteDataSource(sl()));

  // Remote Data Source [API]
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<AppIntercepters>(
      () => AppIntercepters(client: sl()));
  sl.registerLazySingleton<ApiConsumer>(
    () => DioConsumer(client: sl()),
  );
}
