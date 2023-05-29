import 'package:flutter/painting.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color_config.dart';

class TextStyleConfig {
  static TextStyle h1 = GoogleFonts.roboto(
    fontSize: 25.sp,
    fontWeight: FontWeight.w800,
    color: ColorConfig.background,
  );

  static TextStyle h2 = GoogleFonts.roboto(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: ColorConfig.background,
  );

  static TextStyle title = GoogleFonts.roboto(
    fontSize: 15.sp,
    fontWeight: FontWeight.w600,
    color: ColorConfig.background,
  );

  static TextStyle body = GoogleFonts.roboto(
    fontSize: 12.sp,
    color: ColorConfig.background,
  );

  static TextStyle infoTitle = GoogleFonts.roboto(
    fontSize: 11.sp,
    fontWeight: FontWeight.w600,
    color: ColorConfig.background,
  );

  static TextStyle infoBody = GoogleFonts.roboto(
    fontSize: 11.sp,
    color: ColorConfig.background,
  );

  static TextStyle dateBody = GoogleFonts.roboto(
    fontSize: 9.sp,
    fontWeight: FontWeight.w400,
    color: ColorConfig.darkGrey,
  );
}
