import 'package:elevate_online_exams/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: AppColors.blue,
      onPrimary: AppColors.white,
      secondary: AppColors.black,
      onSecondary: AppColors.white,
      error: AppColors.red,
      onError: AppColors.white,
      surface: AppColors.white,
      onSurface: AppColors.blue,
    ),
    textTheme: TextTheme(
      bodyLarge: getRobotoTextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: getInterTextStyle(fontSize: 16.sp),
      bodySmall: getInterTextStyle(fontSize: 14.sp),
    ),
    inputDecorationTheme: InputDecorationTheme(
    
      filled: true,
      fillColor: AppColors.white,
      hintStyle: getInterTextStyle(fontSize: 14.sp, color: AppColors.gray),
      labelStyle: getInterTextStyle(fontSize: 14.sp, color: AppColors.black),
      errorStyle: getInterTextStyle(fontSize: 14.sp, color: AppColors.red),
      border: getOutlineInputBorder(AppColors.gray),
      focusedBorder: getOutlineInputBorder(AppColors.gray),
      enabledBorder: getOutlineInputBorder(AppColors.gray),
      errorBorder: getOutlineInputBorder(AppColors.red),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blue,
        disabledBackgroundColor: AppColors.gray,
        textStyle: getInterTextStyle(fontSize: 16.sp, color: AppColors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
      ),
    ),
  );

  static InputBorder getOutlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.r),
      borderSide: BorderSide(color: color, width: 1.w),
    );
  }

  static TextStyle getInterTextStyle({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return GoogleFonts.inter(
      color: color ?? AppColors.black,
      fontSize: fontSize ?? 18.sp,
      fontWeight: fontWeight ?? FontWeight.normal,
    );
  }

  static TextStyle getRobotoTextStyle({
    Color? color,
    double? fontSize,
    FontWeight? fontWeight,
  }) {
    return GoogleFonts.inter(
      color: color ?? AppColors.black,
      fontSize: fontSize ?? 18.sp,
      fontWeight: fontWeight ?? FontWeight.normal,
    );
  }
}
