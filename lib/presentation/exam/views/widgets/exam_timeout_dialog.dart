import 'package:elevate_online_exams/core/resources/app_assets.dart';
import 'package:elevate_online_exams/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/app_colors.dart';

class ExamTimeoutDialog {
  ExamTimeoutDialog({
    required BuildContext context,
    required void Function() onPressed,
  }) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (ctx) {
        return AlertDialog(
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            spacing: 24.h,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(ImageAssets.sandClockImage),
                  Text(
                    AppLocalizations.of(ctx).timeOut,
                    style: Theme.of(ctx).textTheme.bodySmall?.copyWith(
                      color: AppColors.red,
                      fontSize: 24.sp,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: onPressed,
                child: Text(
                  AppLocalizations.of(context).viewScore,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
