import 'package:elevate_online_exams/core/resources/app_theme.dart';
import 'package:elevate_online_exams/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordCustamAppBar extends StatelessWidget {
  const ChangePasswordCustamAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          child: Icon(Icons.arrow_back_ios, size: 20.sp),
          onTap: () => Navigator.pop(context),
        ),
        SizedBox(width: 8.w),
        Text(
          AppLocalizations.of(context).resetPassword,
          style: AppTheme.getTextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
