import 'package:elevate_online_exams/core/resources/app_assets.dart';
import 'package:elevate_online_exams/core/resources/app_colors.dart';
import 'package:elevate_online_exams/core/resources/app_theme.dart';
import 'package:elevate_online_exams/core/route_generator/routes.dart';
import 'package:elevate_online_exams/domain/model/subject_exams_model.dart';
import 'package:elevate_online_exams/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubjectExamsListViewItem extends StatelessWidget {
  final SubjectExamsModel subjectExam;
  final String subjectName;
  const SubjectExamsListViewItem({
    super.key,
    required this.subjectExam,
    required this.subjectName,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(
            context,
            Routes.startExamScreen,
            arguments: {"exam": subjectExam, "subjectName": subjectName},
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
          height: 103.h,
          width: 343.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10.r)),
            color: AppColors.white,
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: AppColors.shadowGray.withOpacity(0.25),
                blurRadius: 8.r,
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(ImageAssets.profitImage, height: 70.h, width: 60.w),
              SizedBox(width: 8.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            subjectExam.title ?? "Exam Title",
                            style: AppTheme.getTextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            "${subjectExam.numberOfQuestions} ${AppLocalizations.of(context).question}",
                            style: AppTheme.getTextStyle(
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w400,
                              color: AppColors.gray,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${AppLocalizations.of(context).from} 1.00",
                                style: AppTheme.getTextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                "${AppLocalizations.of(context).to} 6.00",
                                style: AppTheme.getTextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.w),
              Text(
                "${subjectExam.duration} ${AppLocalizations.of(context).minutes}",
                style: AppTheme.getTextStyle(
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.blue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
