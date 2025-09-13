import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'colours.dart';
import 'texts.dart';

class Buttons {
  static final kElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      fixedSize: Size(100.w - 60, 6.h),
      textStyle: GoogleFonts.cairo(
        textStyle: TextStyle(
          fontSize: 17.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      backgroundColor: Colours.kHighlightColor4,
      disabledBackgroundColor: Colours.kHighlightColor4.withOpacity(0.5),
      foregroundColor: Colours.kPrimaryColor,
      disabledForegroundColor: Colours.kPrimaryColor,
      elevation: 0.0,
    ),
  );
  static final kOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: Colours.kPrimaryColor,
      foregroundColor: Colours.kHighlightColor4,
      disabledForegroundColor: Colours.kHighlightColor4.withOpacity(0.5),
      elevation: 0.0,
      fixedSize: Size(100.w - 60, 6.h),
      textStyle: GoogleFonts.cairo(
        textStyle: TextStyle(
          fontSize: 17.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      side: const BorderSide(
        width: 2.0,
        color: Colours.kHighlightColor4,
      ),
    ),
  );
  static final kTextButtonTheme = TextButtonThemeData(
    style: TextButton.styleFrom(
      textStyle: GoogleFonts.cairo(
        fontSize: 17.sp,
        fontWeight: FontWeight.bold,
      ),
      foregroundColor: Colours.kHighlightColor4,
      backgroundColor: Colors.transparent,
      disabledForegroundColor: Colours.kHighlightColor4.withOpacity(0.4),
      disabledBackgroundColor: Colors.transparent,
    ),
  );
  static const kFloatingActionButtonTheme = FloatingActionButtonThemeData(
    backgroundColor: Colours.kHighlightColor4,
    foregroundColor: Colours.kPrimaryColor,
  );
  static final kToggleButtonsTheme = ToggleButtonsThemeData(
    color: Colours.kHighlightColor4,
    selectedColor: Colours.kHighlightColor4,
    fillColor: Colours.kHighlightColor4.withOpacity(0.1),
    borderColor: Colours.kHighlightColor4.withOpacity(0.5),
    selectedBorderColor: Colours.kHighlightColor4,
    borderRadius: const BorderRadius.all(
      Radius.circular(8.0),
    ),
    textStyle: Texts.kTitleMediumStyle.copyWith(
      color: Colours.kHighlightColor4,
    ),
  );
  static final kExpansionTileTheme = ExpansionTileThemeData(
    iconColor: Colours.kHighlightColor1,
    backgroundColor: Colours.kUnselectedColor.withOpacity(0.4),
    collapsedBackgroundColor: Colours.kUnselectedColor.withOpacity(0.4),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
    ),
    collapsedShape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(10.0),
      ),
    ),
    childrenPadding: const EdgeInsets.only(
      right: 15.0,
      left: 15.0,
      bottom: 15.0,
    ),
  );
  static final kSwitchTheme = SwitchThemeData(
    trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
    thumbColor: const WidgetStatePropertyAll(Colours.kPrimaryColor),
    trackColor: WidgetStateProperty.resolveWith((Set states) {
      if (states.contains(WidgetState.pressed) ||
          states.contains(WidgetState.selected)) {
        return Colours.kSuccessColor;
      }
      return Colours.kDescriptionColor;
    }),
  );
  static const kCheckBoxTheme = CheckboxThemeData(
    side: BorderSide(
      color: Colours.kHighlightColor4,
      width: 2.0,
    ),
  );
  static const kRadioTheme = RadioThemeData(
    fillColor: WidgetStatePropertyAll(Colours.kHighlightColor1),
  );
  static const kScrollBarTheme = ScrollbarThemeData(
    thumbColor: WidgetStatePropertyAll(Colours.kSecondaryColor),
  );
}
