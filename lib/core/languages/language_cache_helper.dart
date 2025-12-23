import 'package:clean_architecture_template/core/network/local/secure_storage.dart';

class LanguageCacheHelper {
  Future<void> cacheLanguageCode(String languageCode) async =>
      await SecureStorage.instance.write(key: "locale", value: languageCode);

  Future<String> getCachedLanguageCode() async {
    final cachedLanguageCode = await SecureStorage.instance.read(key: "locale");
    return cachedLanguageCode ?? "en";
  }
}
