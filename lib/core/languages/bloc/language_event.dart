part of 'language_bloc.dart';

abstract class LanguageEvent {
  const LanguageEvent();
}

class ChangeLanguage extends LanguageEvent {
  final String languageCode;
  const ChangeLanguage({required this.languageCode});
}

class GetSavedLanguage extends LanguageEvent {}
