import 'package:elevate_online_exams/core/app/constants.dart';
import 'package:elevate_online_exams/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
      bodySmall: getTextStyle(),
      bodyMedium: getTextStyle(fontSize: 16.sp, fontWeight: FontWeight.w500),
      bodyLarge: getTextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      titleTextStyle: getTextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(color: AppColors.black),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      hintStyle: getTextStyle(color: AppColors.gray),
      labelStyle: getTextStyle(),
      errorStyle: getTextStyle(color: AppColors.red),
      border: getOutlineInputBorder(color: AppColors.gray),
      focusedBorder: getOutlineInputBorder(color: AppColors.gray),
      enabledBorder: getOutlineInputBorder(color: AppColors.gray),
      errorBorder: getOutlineInputBorder(color: AppColors.red),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blue,
        disabledBackgroundColor: AppColors.gray,
        textStyle: getTextStyle(
          fontSize: 16.sp,
          color: AppColors.white,
          fontWeight: FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
        side: BorderSide(color: AppColors.blue, width: 1.w)
      ),
    ),
    dialogTheme: DialogThemeData(
      titleTextStyle: getTextStyle(
        fontSize: 24.sp,
        fontWeight: FontWeight.bold,
      ),
      contentTextStyle: getTextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
      ),
    ),
  );

  static InputBorder getOutlineInputBorder({required Color color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(4.r),
      borderSide: BorderSide(color: color, width: 1.w),
    );
  }

  static TextStyle getTextStyle({
    Color? color,
    double? fontSize,
    String? fontFamily,
    FontWeight? fontWeight,
  }) {
    return TextStyle(
      color: color ?? AppColors.black,
      fontSize: fontSize ?? 14.sp,
      fontFamily: fontFamily ?? Constants.interFont,
      fontWeight: fontWeight ?? FontWeight.normal,
    );
  }
}
