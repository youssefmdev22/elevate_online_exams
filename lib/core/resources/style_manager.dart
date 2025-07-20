import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'font_manager.dart';

TextStyle _getTextStyle(
  double? fontSize,
  FontWeight? fontWeight,
  Color? color,
  String? fontFamily,
) {
  return TextStyle(
    fontSize: fontSize ?? FontSize.s16,
    fontFamily: fontFamily ?? FontConstants.interFont,
    color: color ?? AppColors.black,
    fontWeight: fontWeight ?? FontWeightManager.regular,
  );
}

TextStyle getRegularStyle({
  double? fontSize,
  Color? color,
  String? fontFamily,
}) {
  return _getTextStyle(
    fontSize ?? FontSize.s14,
    FontWeightManager.regular,
    color,
    fontFamily,
  );
}

TextStyle getMediumStyle({double? fontSize, Color? color, String? fontFamily}) {
  return _getTextStyle(
    fontSize ?? FontSize.s16,
    FontWeightManager.medium,
    color,
    fontFamily,
  );
}

TextStyle getSemiBoldStyle({
  double? fontSize,
  Color? color,
  String? fontFamily,
}) {
  return _getTextStyle(
    fontSize ?? FontSize.s20,
    FontWeightManager.semiBold,
    color,
    fontFamily,
  );
}

TextStyle getBoldStyle({double? fontSize, Color? color, String? fontFamily}) {
  return _getTextStyle(
    fontSize ?? FontSize.s24,
    FontWeightManager.bold,
    color,
    fontFamily,
  );
}
