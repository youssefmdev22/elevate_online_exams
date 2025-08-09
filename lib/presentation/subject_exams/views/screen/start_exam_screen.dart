import 'package:elevate_online_exams/core/resources/app_assets.dart';
import 'package:elevate_online_exams/core/resources/app_colors.dart';
import 'package:elevate_online_exams/core/resources/app_theme.dart';
import 'package:elevate_online_exams/domain/model/subject_exams_model.dart';
import 'package:elevate_online_exams/generated/l10n.dart';
import 'package:elevate_online_exams/presentation/subject_exams/views/widgets/custom_instructions_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StartExamScreen extends StatelessWidget {
  const StartExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final subjectExam = arguments['exam'] as SubjectExamsModel;
    final subjectName = arguments['subjectName'] as String;
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      ImageAssets.profitImage,
                      width: 42.w,
                      height: 47.h,
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Text(
                        subjectName,
                        style: AppTheme.getTextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "${subjectExam.duration.toString()} ${AppLocalizations.of(context).minutes}",
                      style: AppTheme.getTextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.blue,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      subjectExam.title ?? "Exam Title",
                      style: AppTheme.getTextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    SizedBox(
                      height: 21.h, // set a fixed height
                      child: VerticalDivider(
                        width: 1.w,
                        thickness: 1,
                        color: AppColors.dividerBlue,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      "${subjectExam.numberOfQuestions.toString()} ${AppLocalizations.of(context).question}",
                      style: AppTheme.getTextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: AppColors.gray,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Divider(
                color: Colors.blue[10],
                thickness: 0.5, // Line thickness
              ),
              SizedBox(height: 24.h),
              CustomInstructionsSection(),
              SizedBox(height: 48.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: SizedBox(
                  width: double.infinity,
                  height: 48.h,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to the exam screen
                    },
                    child: Text(
                      AppLocalizations.of(context).start,
                      style: AppTheme.getTextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
