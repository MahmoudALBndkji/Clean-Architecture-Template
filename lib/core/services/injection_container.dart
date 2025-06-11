import 'api_service.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:clean_architecture_template/core/languages/bloc/language_bloc.dart';
import 'package:clean_architecture_template/features/home/presentation/bloc/home_bloc.dart';
import 'package:clean_architecture_template/features/auth/domain/usecases/login_use_case.dart';
import 'package:clean_architecture_template/features/auth/domain/repositories/auth_repositories.dart';
import 'package:clean_architecture_template/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:clean_architecture_template/features/auth/data/repositories/auth_repositories_imp.dart';
import 'package:clean_architecture_template/features/auth/presentation/bloc/authentication_bloc.dart';

final sl = GetIt.instance;
Future<void> init() async {
  // Bloc
  sl.registerFactory(() => LanguageBloc());
  sl.registerFactory(() => AuthenticationBloc(loginUseCase: sl()));
  sl.registerFactory(() => HomeBloc());

  // [Usecases]
  sl.registerLazySingleton(() => LoginUseCase(repository: sl()));

  // [Repository]
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImp(authRemoteDataSource: sl()),
  );

  // [DataSources]
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(service: sl()),
  );

  sl.registerLazySingleton(() => ApiService());

  // External
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
}
