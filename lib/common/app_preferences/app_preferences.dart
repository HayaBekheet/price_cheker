abstract class AppPreferences {
  bool isBaseUrlSet();
  String getBaseUrl();
  Future<void> setBaseUrl(String baseUrl);
  Future<String> getLanguageCode();
  Future<void> setLanguageCode(String languageCode);
  int getProductCardDisplayTime();
  Future<void> setProductCardDisplayTime(int seconds);
}
