import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';
import 'app_fonts.dart';

class AppStyles{

  static TextStyle primaryHeadLinesStyle = TextStyle(
    fontFamily: AppFonts.mainFontName,
    fontSize: 32.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.blackColor
  );

  static TextStyle subtitlesStyle = TextStyle(
      fontFamily: AppFonts.mainFontName,
      fontSize: 16.sp,
      fontWeight: FontWeight.w400,
      color: AppColors.secondaryColor
  );

  static TextStyle black16w500Style = TextStyle(
      fontFamily: AppFonts.mainFontName,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.blackColor
  );

  static TextStyle grey12MediumStyle = TextStyle(
      fontFamily: AppFonts.mainFontName,
      fontSize: 12.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.greyColor
  );

  static TextStyle white15w600Style = TextStyle(
      fontFamily: AppFonts.mainFontName,
      fontSize: 15.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.whiteColor
  );

  static TextStyle secondary15w15Style = TextStyle(
      fontFamily: AppFonts.mainFontName,
      fontSize: 15.sp,
      fontWeight: FontWeight.w500,
      color: AppColors.secondaryColor
  );

  static TextStyle black15w700Style = TextStyle(
      fontFamily: AppFonts.mainFontName,
      fontSize: 15.sp,
      fontWeight: FontWeight.w700,
  );
  static TextStyle grey14w600Style = TextStyle(
      fontFamily: AppFonts.mainFontName,
      fontSize: 14.sp,
      fontWeight: FontWeight.w600,
      color: AppColors.secondaryColor
  );
}

