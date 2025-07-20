import 'package:elevate_online_exams/core/resources/app_colors.dart';
import 'package:elevate_online_exams/core/resources/style_manager.dart';
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
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.white,
      titleTextStyle: getSemiBoldStyle(color: AppColors.black),
      iconTheme: IconThemeData(color: AppColors.black),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      hintStyle: getRegularStyle(color: AppColors.gray),
      labelStyle: getRegularStyle(),
      errorStyle: getRegularStyle(color: AppColors.red),
      border: getOutlineInputBorder(AppColors.gray),
      focusedBorder: getOutlineInputBorder(AppColors.gray),
      enabledBorder: getOutlineInputBorder(AppColors.gray),
      errorBorder: getOutlineInputBorder(AppColors.red),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blue,
        disabledBackgroundColor: AppColors.gray,
        textStyle: getMediumStyle(color: AppColors.white),
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
}
