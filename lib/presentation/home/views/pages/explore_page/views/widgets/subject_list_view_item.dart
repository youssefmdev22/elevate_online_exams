import 'package:elevate_online_exams/core/resources/app_colors.dart';
import 'package:elevate_online_exams/core/resources/app_theme.dart';
import 'package:elevate_online_exams/domain/model/subject_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubjectListViewItem extends StatelessWidget {
  final SubjectModel subject;
  const SubjectListViewItem({super.key, required this.subject});
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      child: Container(
        height: 80.h,
        width: 343.w,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: AppColors.shadowGray.withOpacity(0.25),
              blurRadius: 8.r,
            ),
          ],
        ),
        child: Row(
          children: [
            SizedBox(width: 24.w),
            Container(
              height: 48.h,
              width: 48.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                image: DecorationImage(
                  image: NetworkImage(subject.icon ?? ''),
                ),
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              subject.name ?? '',
              style: AppTheme.getTextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}