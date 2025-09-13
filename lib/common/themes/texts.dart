import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class Texts {
  static final kTitleLargeStyle = GoogleFonts.cairo(
    textStyle: TextStyle(
      fontSize: 19.sp,
      fontWeight: FontWeight.bold,
    ),
  );
  static final kTitleMediumStyle = GoogleFonts.cairo(
    textStyle: TextStyle(
      fontSize: 17.sp,
      fontWeight: FontWeight.bold,
    ),
  );
  static final kTitleSmallStyle = GoogleFonts.cairo(
    textStyle: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
    ),
  );
  static final kBodyLargeStyle = GoogleFonts.cairo(
    textStyle: TextStyle(
      fontSize: 29.sp,
      fontWeight: FontWeight.normal,
    ),
  );
  static final kBodyMediumStyle = GoogleFonts.cairo(
    textStyle: TextStyle(
      fontSize: 16.sp,
      fontWeight: FontWeight.normal,
    ),
  );
  static final kBodySmallStyle = GoogleFonts.cairo(
    textStyle: TextStyle(
      fontSize: 14.sp,
      fontWeight: FontWeight.normal,
    ),
  );
}
