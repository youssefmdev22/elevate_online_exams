import 'package:elevate_online_exams/core/resources/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAppBar extends StatelessWidget {
  final String subjectName;
  const CustomAppBar({super.key, required this.subjectName});

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
          subjectName,
          style: AppTheme.getTextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
