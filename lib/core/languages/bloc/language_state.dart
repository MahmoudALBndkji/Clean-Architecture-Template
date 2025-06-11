part of 'language_bloc.dart';

abstract class LanguageState {
  const LanguageState();
}

final class LanguageInitial extends LanguageState {}

class ChangeLanguageState extends LanguageState {
  final Locale locale;
  const ChangeLanguageState({required this.locale});
}
