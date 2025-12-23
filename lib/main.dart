import 'dart:io';
import 'package:clean_architecture_template/core/network/local/secure_storage.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture_template/clean_arch_template.dart';
import 'package:clean_architecture_template/core/errors/custom_error.dart';
import 'package:clean_architecture_template/core/network/bloc_observer.dart';
import 'package:clean_architecture_template/core/network/local/cache_helper.dart';
import 'package:clean_architecture_template/core/network/local/http_certificate.dart';
import 'package:clean_architecture_template/core/services/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await SecureStorage.instance.init();
  HttpOverrides.global = MyHttpOverrides();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  customError();
  Bloc.observer = MyBlocObserver();
  await initServiceLocator();
  runApp(const CleanArchTemplate());
}
