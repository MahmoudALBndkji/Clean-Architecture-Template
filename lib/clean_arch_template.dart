import 'package:clean_architecture_template/core/constants/constants.dart';
import 'package:clean_architecture_template/core/languages/app_localizations.dart';
import 'package:clean_architecture_template/core/languages/bloc/language_bloc.dart';
import 'package:clean_architecture_template/features/splash/presentation/pages/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/services/injection_container.dart' as di;

class CleanArchTemplate extends StatelessWidget {
  const CleanArchTemplate({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => di.sl<LanguageBloc>()..add(GetSavedLanguage()),
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, state) {
          if (state is ChangeLanguageState) {
            return MaterialApp(
              locale: state.locale,
              title: "Clean Arch Template",
              debugShowCheckedModeBanner: false,
              supportedLocales: const [
                Locale("en"),
                Locale("ar"),
              ],
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              localeResolutionCallback: (deviceLocale, supportedLocales) {
                for (Locale locale in supportedLocales) {
                  if (deviceLocale != null &&
                      deviceLocale.languageCode == locale.languageCode) {
                    return deviceLocale;
                  }
                }
                return supportedLocales.first;
              },
              theme: ThemeData(
                fontFamily: 'myFont',
                useMaterial3: true,
                textSelectionTheme: TextSelectionThemeData(
                  cursorColor: primaryColor,
                  selectionColor: primaryColor,
                  selectionHandleColor: primaryColor,
                ),
              ),
              home: const SplashPage(),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
