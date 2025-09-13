import 'package:flutter/material.dart';

import 'colours.dart';
import 'texts.dart';

class Bars {
  static final kAppBarTheme = AppBarTheme(
    backgroundColor: Colours.kHighlightColor4,
    foregroundColor: Colours.kPrimaryColor,
    elevation: 0.0,
    centerTitle: true,
    titleTextStyle: Texts.kTitleMediumStyle,
    iconTheme: const IconThemeData(color: Colours.kPrimaryColor),
    actionsIconTheme: const IconThemeData(
      color: Colours.kPrimaryColor,
    ),
  );
  static final kTabBarTheme = TabBarThemeData(
    indicatorColor: Colours.kPrimaryColor,
    indicatorSize: TabBarIndicatorSize.tab,
    labelStyle: Texts.kBodyMediumStyle.copyWith(
      color: Colours.kPrimaryColor,
      fontWeight: FontWeight.bold,
    ),
    unselectedLabelStyle: Texts.kBodyMediumStyle.copyWith(
      color: Colours.kPrimaryColor,
      fontWeight: FontWeight.bold,
    ),
  );
}
