import 'dart:ui';
import 'package:clean_architecture_template/core/languages/language_cache_helper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  static LanguageBloc get(context) => BlocProvider.of(context);

  String? selectedLanguage;
  LanguageBloc() : super(LanguageInitial()) {
    on<LanguageEvent>((event, emit) async {
      if (event is ChangeLanguage) {
        await blockChangeLanguage(emit, event);
      } else if (event is GetSavedLanguage) {
        await blockGetSavedLanguage(emit);
      }
    });
  }

  Future<void> blockGetSavedLanguage(Emitter<LanguageState> emit) async {
    final String cachedLanguageCode =
        await LanguageCacheHelper().getCachedLanguageCode();
    emit(ChangeLanguageState(
        locale: Locale(cachedLanguageCode.substring(0, 2))));
  }

  Future<void> blockChangeLanguage(
      Emitter<LanguageState> emit, ChangeLanguage event) async {
    emit(LanguageInitial());
    selectedLanguage = event.languageCode.toString();
    await LanguageCacheHelper().cacheLanguageCode(event.languageCode);
    emit(ChangeLanguageState(locale: Locale(event.languageCode)));
  }
}
