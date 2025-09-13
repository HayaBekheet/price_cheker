import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_preferences/app_preferences.dart';
import 'app_preferences/app_preferences_imp.dart';
//import 'package:dio/dio.dart';

final getIt = GetIt.instance;

Future<void> setupServiceLocator() async {
  getIt.registerSingleton<SharedPreferences>(
    await SharedPreferences.getInstance(),
  );
  getIt.registerSingleton<AppPreferences>(
    AppPreferencesImp(getIt<SharedPreferences>()),
  );
}

/*void setupDio(String languageCode, {String? username}) {
  getIt.allowReassignment = true;
  getIt.registerSingleton<Dio>(
    Dio()
      ..options = BaseOptions(
        baseUrl: '${getIt<AppPreferencesRepository>().getBaseUrl()}/_svc/v1',
        connectTimeout: const Duration(seconds: 30),
        persistentConnection: false,
        sendTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        contentType: Headers.jsonContentType,
        responseType: ResponseType.json,
        headers: {
          "amz-api-key": Keys.kAmazonAPIKey,
          "x-lang": languageCode,
          "x-client-info": Uri.encodeComponent(
            username ?? getIt<AppPreferencesRepository>().getAppUsername(),
          ),
        },
      ),
  );
}*/
