import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'texts.dart';
import 'colours.dart';

class InputDecorations {
  static final kInputDecoration = InputDecorationTheme(
    filled: true,
    fillColor: Colours.kFillColor,
    labelStyle: Texts.kBodyMediumStyle.copyWith(
      color: Colours.kHighlightColor1,
    ),
    hintStyle: Texts.kBodyMediumStyle.copyWith(
      color: Colours.kDescriptionColor,
    ),
    prefixIconColor: Colours.kDescriptionColor,
    suffixIconColor: Colours.kDescriptionColor,
    suffixStyle:
        Texts.kBodyMediumStyle.copyWith(color: Colours.kHighlightColor1),
    errorStyle: Texts.kBodyMediumStyle.copyWith(
      color: Colours.kErrorColor,
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: Colours.kFillColor,
      ),
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: Colours.kFillColor,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: Colours.kFillColor,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: Colours.kErrorColor,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: Colours.kErrorColor,
      ),
    ),
    constraints: BoxConstraints(
      maxWidth: 100.w - 60,
      minHeight: 8.h,
    ),
  );
  static final kDataTableTheme = DataTableThemeData(
    headingTextStyle: Texts.kTitleSmallStyle.copyWith(
      color: Colours.kSecondaryColor,
    ),
    dataTextStyle: Texts.kBodySmallStyle.copyWith(
      color: Colours.kHighlightColor1,
    ),
    headingRowColor: WidgetStatePropertyAll(
      Colours.kSecondaryColor.withOpacity(0.2),
    ),
    dataRowColor: WidgetStateColor.resolveWith(
      (states) {
        if (states.contains(WidgetState.selected)) {
          return Colours.kAccentColor.withOpacity(0.1);
        }
        return Colors.transparent;
      },
    ),
    headingRowHeight: 35.0,
    dataRowMinHeight: 35.0,
    dataRowMaxHeight: 35.0,
  );
}
