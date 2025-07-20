import 'package:elevate_online_exams/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../l10n/get_translations.dart';
import '../resources/font_manager.dart';
import '../resources/style_manager.dart';

class CustomDialog {
  final BuildContext context;

  String? title, message, positiveText, negativeText;

  VoidCallback? positiveOnClick, negativeOnClick;

  CustomDialog.loading({
    required this.context,
    this.message,
    bool cancelable = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: cancelable,
      builder: (ctx) {
        return AlertDialog(
          content: Row(
            spacing: 16.w,
            children: [
              const CircularProgressIndicator(),
              Text(
                message ?? getTranslations(ctx).loading,
                style: getSemiBoldStyle(),
              ),
            ],
          ),
        );
      },
    );
  }

  CustomDialog.positiveButton({
    required this.context,
    this.title,
    this.message,
    this.positiveText,
    this.positiveOnClick,
    bool cancelable = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: cancelable,
      builder: (ctx) {
        return AlertDialog(
          title: Text(title ?? "", style: getBoldStyle()),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 20.h,
            children: [
              Text(message ?? "", style: getSemiBoldStyle()),
              ElevatedButton(
                onPressed: () {
                  if (positiveOnClick != null) {
                    positiveOnClick!();
                  } else {
                    Navigator.of(ctx).pop();
                  }
                },
                child: Text(
                  positiveText ?? getTranslations(ctx).ok,
                  style: getBoldStyle(
                    fontSize: FontSize.s16,
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  CustomDialog.positiveAndNegativeButton({
    required this.context,
    this.title,
    this.message,
    this.positiveText,
    this.negativeText,
    this.positiveOnClick,
    this.negativeOnClick,
    bool cancelable = true,
  }) {
    showDialog(
      context: context,
      barrierDismissible: cancelable,
      builder: (ctx) {
        return AlertDialog(
          title: Text(title ?? "", style: getBoldStyle()),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            spacing: 20.h,
            children: [
              Text(message ?? "", style: getSemiBoldStyle()),
              Row(
                mainAxisSize: MainAxisSize.max,
                spacing: 16.w,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.gray,
                      ),
                      onPressed: () {
                        if (negativeOnClick != null) {
                          negativeOnClick!();
                        } else {
                          Navigator.of(ctx).pop();
                        }
                      },
                      child: Text(
                        negativeText ?? getTranslations(ctx).no,
                        style: getBoldStyle(
                          fontSize: FontSize.s16,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (positiveOnClick != null) {
                          positiveOnClick!();
                        } else {
                          Navigator.of(ctx).pop();
                        }
                      },
                      child: Text(
                        positiveText ?? getTranslations(ctx).yes,
                        style: getBoldStyle(
                          fontSize: FontSize.s16,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
