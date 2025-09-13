import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'presentation/views/home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  if (Platform.isAndroid || Platform.isIOS) {
    const List<Locale> supportedLocales = [
      Locale('en', 'US'),
      Locale('ar', 'SA'),
    ];
    await EasyLocalization.ensureInitialized();
    runApp(
      EasyLocalization(
        supportedLocales: supportedLocales,
        path: 'assets/translations',
        startLocale: supportedLocales[0],
        fallbackLocale: supportedLocales[0],
        child: const PriceCheckerApp(),
      ),
    );
  }
}

class PriceCheckerApp extends StatelessWidget {
  const PriceCheckerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      maxMobileWidth: 400.0,
      maxTabletWidth: 1400.0,
      builder: (context, orientation, screenType) {
        SystemChrome.setPreferredOrientations(
          screenType == ScreenType.mobile
              ? [
                  DeviceOrientation.portraitUp,
                  DeviceOrientation.portraitDown,
                ]
              : [
                  DeviceOrientation.landscapeRight,
                  DeviceOrientation.landscapeLeft,
                ],
        );
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Price Checker',
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          home: HomeScreen(),
        );
      },
    );
  }
}
