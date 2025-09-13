import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

import 'app_preferences.dart';

class AppPreferencesImp implements AppPreferences {
  late final SharedPreferences preferences;

  AppPreferencesImp(this.preferences);

  @override
  bool isBaseUrlSet() {
    return preferences.containsKey('base-url');
  }

  @override
  String getBaseUrl() {
    return preferences.getString('base-url')!;
  }

  @override
  Future<void> setBaseUrl(String baseUrl) async {
    await preferences.setString('base-url', baseUrl);
  }

  @override
  Future<String> getLanguageCode() async {
    String? languageCode = preferences.getString('language-code');
    if (languageCode == null) {
      languageCode = Platform.localeName.split('_')[0];
      await setLanguageCode(languageCode);
    }
    return languageCode;
  }

  @override
  Future<void> setLanguageCode(String languageCode) async {
    await preferences.setString('language-code', languageCode);
  }
}
