import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'common/themes/colours.dart';
import 'common/themes/bars.dart';
import 'common/themes/bottom_sheet_style.dart';
import 'common/themes/buttons.dart';
import 'common/themes/dialogs.dart';
import 'common/themes/input_decorations.dart';
import 'common/themes/texts.dart';
import 'common/service_locator.dart';
import 'common/app_preferences/app_preferences.dart';
import 'presentation/views/home/home.dart';
import 'presentation/views/settings/settings.dart';

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
    await Future.wait([
      EasyLocalization.ensureInitialized(),
      setupServiceLocator(),
    ]);
    final String languageCode =
    await getIt<AppPreferences>().getLanguageCode();
    final Locale locale =
    languageCode == 'en' ? supportedLocales[0] : supportedLocales[1];
    runApp(
      EasyLocalization(
        supportedLocales: supportedLocales,
        path: 'assets/translations',
        startLocale: locale,
        fallbackLocale: locale,
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
              ? [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
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
          theme: ThemeData(
            appBarTheme: Bars.kAppBarTheme,
            tabBarTheme: Bars.kTabBarTheme,
            scaffoldBackgroundColor: Colours.kPrimaryColor,
            inputDecorationTheme: InputDecorations.kInputDecoration,
            dataTableTheme: InputDecorations.kDataTableTheme,
            textTheme: TextTheme(
              titleLarge: Texts.kTitleLargeStyle,
              titleMedium: Texts.kTitleMediumStyle,
              titleSmall: Texts.kTitleSmallStyle,
              bodyLarge: Texts.kBodyLargeStyle,
              bodyMedium: Texts.kBodyMediumStyle,
              bodySmall: Texts.kBodySmallStyle,
            ),
            elevatedButtonTheme: Buttons.kElevatedButtonTheme,
            outlinedButtonTheme: Buttons.kOutlinedButtonTheme,
            textButtonTheme: Buttons.kTextButtonTheme,
            floatingActionButtonTheme: Buttons.kFloatingActionButtonTheme,
            toggleButtonsTheme: Buttons.kToggleButtonsTheme,
            expansionTileTheme: Buttons.kExpansionTileTheme,
            scrollbarTheme: Buttons.kScrollBarTheme,
            switchTheme: Buttons.kSwitchTheme,
            checkboxTheme: Buttons.kCheckBoxTheme,
            radioTheme: Buttons.kRadioTheme,
            dialogTheme: Dialogs.kDialogTheme,
            datePickerTheme: Dialogs.kDatePickerTheme,
            timePickerTheme: Dialogs.kTimePickerTheme,
            bottomSheetTheme: BottomSheetStyle.kBottomSheetStyle,
          ),
          home: HomeScreen(),
          routes: {
            HomeScreen.routeName: (ctx) => const HomeScreen(),
            SettingsScreen.routeName: (ctx) => const SettingsScreen(),
          },
        );
      },
    );
  }
}
