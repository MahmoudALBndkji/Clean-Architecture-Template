import 'dart:io';
import 'package:clean_architecture_template/clean_arch_template.dart';
import 'package:clean_architecture_template/core/error/custom_error.dart';
import 'package:clean_architecture_template/core/network/bloc_observer.dart';
import 'package:clean_architecture_template/core/network/local/cache_helper.dart';
import 'package:clean_architecture_template/core/network/local/http_certificate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/services/injection_container.dart' as di;

void main() async {
  // if main is (async) we used this for check for All
  // in Method is executed and Then Run This Application
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  HttpOverrides.global = MyHttpOverrides();
  // For Prevent Screen Rotation
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // Handling Custom Show Error
  customError();
  Bloc.observer = MyBlocObserver();
  await di.init();
  runApp(const CleanArchTemplate());
}
