import 'package:elevate_online_exams/core/resources/app_colors.dart';
import 'package:elevate_online_exams/presentation/exam/view_models/exam_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../domain/model/check_questions_model.dart';
import '../../../../generated/l10n.dart';

class ExamScoreScreen extends StatelessWidget {
  final CheckQuestionsModel checkQuestionsData;
  final ExamViewModel examViewModel;

  const ExamScoreScreen({
    super.key,
    required this.checkQuestionsData,
    required this.examViewModel,
  });

  @override
  Widget build(BuildContext context) {
    double total = double.parse(checkQuestionsData.total!.replaceAll("%", ""));
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        spacing: 24.h,
        children: [
          Text(
            AppLocalizations.of(context).yourScore,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(fontSize: 18.sp),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 22.w,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 120.w,
                    height: 120.w,
                    child: CircularProgressIndicator(
                      year2023: false,
                      value: total / 100,
                      trackGap: 12.w,
                      backgroundColor: AppColors.red,
                      strokeCap: StrokeCap.round,
                      strokeWidth: 6.w,
                    ),
                  ),
                  Text(
                    "${total.toStringAsFixed(0)}%",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(fontSize: 20.sp),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8.h,
                children: [
                  Text(
                    AppLocalizations.of(context).correct,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: AppColors.blue),
                  ),
                  Text(
                    AppLocalizations.of(context).incorrect,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: AppColors.red),
                  ),
                ],
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8.h,
                children: [
                  Container(
                    width: 25.w,
                    height: 25.w,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.w, color: AppColors.blue),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Text(
                        checkQuestionsData.correct.toString(),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 12.sp,
                          color: AppColors.blue,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 25.w,
                    height: 25.w,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.w, color: AppColors.red),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Text(
                        checkQuestionsData.wrong.toString(),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 12.sp,
                          color: AppColors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 56.h),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              AppLocalizations.of(context).showResults,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              examViewModel.restartExam();
            },
            style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
              backgroundColor: WidgetStateProperty.all(AppColors.white),
            ),
            child: Text(
              AppLocalizations.of(context).startAgain,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
