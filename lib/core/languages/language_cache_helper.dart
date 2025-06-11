import 'package:shared_preferences/shared_preferences.dart';

class LanguageCacheHelper {
  Future<void> cacheLanguageCode(String languageCode) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString("locale", languageCode);
  }

  Future<String> getCachedLanguageCode() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final cachedLanguageCode = sharedPreferences.getString("locale");
    return cachedLanguageCode ?? "en";
    // if Not Cache Language Return Default Device Language
    // return cachedLanguageCode ?? Platform.localeName.substring(0, 2);
  }
}
