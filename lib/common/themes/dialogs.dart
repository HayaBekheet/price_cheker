import 'package:flutter/material.dart';

import 'colours.dart';
import 'buttons.dart';
import 'texts.dart';

class Dialogs {
  static final datePickerStateProperty =
      WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.hovered)) {
      return Colours.kAccentColor.withOpacity(0.3);
    } else if (states.contains(WidgetState.pressed)) {
      return Colours.kAccentColor.withOpacity(0.5);
    } else if (states.contains(WidgetState.selected)) {
      return Colours.kAccentColor;
    } else if (states.contains(WidgetState.focused)) {
      return Colours.kAccentColor;
    }
    return null;
  });
  static final timePickerBackgroundStateColor =
      WidgetStateColor.resolveWith((states) {
    if (states.contains(WidgetState.hovered)) {
      return Colours.kAccentColor.withOpacity(0.5);
    } else if (states.contains(WidgetState.pressed) ||
        states.contains(WidgetState.selected)) {
      return Colours.kAccentColor;
    }
    return Colours.kFillColor;
  });
  static final timePickerTextStateColor =
      WidgetStateColor.resolveWith((states) {
    if (states.contains(WidgetState.hovered)) {
      return Colors.white;
    } else if (states.contains(WidgetState.pressed) ||
        states.contains(WidgetState.selected)) {
      return Colors.white;
    }
    return Colours.kAccentColor;
  });
  static final kDatePickerTheme = DatePickerThemeData(
    headerForegroundColor: Colours.kPrimaryColor,
    headerBackgroundColor: Colours.kAccentColor,
    backgroundColor: Colours.kPrimaryColor,
    surfaceTintColor: Colours.kPrimaryColor,
    todayBorder: BorderSide.none,
    todayForegroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.hovered)) {
        return Colors.white;
      } else if (states.contains(WidgetState.pressed)) {
        return Colors.white;
      } else if (states.contains(WidgetState.selected)) {
        return Colors.white;
      } else if (states.contains(WidgetState.focused)) {
        return Colors.white;
      }
      return Colors.black;
    }),
    todayBackgroundColor: datePickerStateProperty,
    dayBackgroundColor: datePickerStateProperty,
    dayOverlayColor: datePickerStateProperty,
    weekdayStyle: Texts.kTitleMediumStyle,
    dayStyle: Texts.kTitleMediumStyle,
    confirmButtonStyle: Buttons.kTextButtonTheme.style,
    cancelButtonStyle: Buttons.kTextButtonTheme.style,
  );
  static final kTimePickerTheme = TimePickerThemeData(
    backgroundColor: Colours.kPrimaryColor,
    dialBackgroundColor: Colours.kPrimaryColor,
    dayPeriodBorderSide: BorderSide.none,
    dayPeriodShape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
      side: BorderSide(color: Colours.kAccentColor),
    ),
    dayPeriodColor: timePickerBackgroundStateColor,
    dayPeriodTextColor: timePickerTextStateColor,
    dialHandColor: Colours.kAccentColor,
    entryModeIconColor: Colours.kAccentColor,
    hourMinuteColor: timePickerBackgroundStateColor,
    hourMinuteTextColor: timePickerTextStateColor,
  );
  static const kDialogTheme = DialogThemeData(
    backgroundColor: Colours.kPrimaryColor,
    surfaceTintColor: Colours.kPrimaryColor,
  );
}
