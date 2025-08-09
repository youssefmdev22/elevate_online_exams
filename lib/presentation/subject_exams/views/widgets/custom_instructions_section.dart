import 'package:elevate_online_exams/core/resources/app_colors.dart';
import 'package:elevate_online_exams/core/resources/app_theme.dart';
import 'package:elevate_online_exams/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInstructionsSection extends StatelessWidget {
  const CustomInstructionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context).instructions,
            style: AppTheme.getTextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 16.h),
          Text(
            '${AppLocalizations.of(context).loremIpsumDolorSitAmetConsectetur}\n'
            '${AppLocalizations.of(context).loremIpsumDolorSitAmetConsectetur}\n'
            '${AppLocalizations.of(context).loremIpsumDolorSitAmetConsectetur}\n'
            '${AppLocalizations.of(context).loremIpsumDolorSitAmetConsectetur}',
            style: AppTheme.getTextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.gray,
            ).copyWith(
              height: 2, // Adjust line height
            ),
          ),
        ],
      ),
    );
  }
}
