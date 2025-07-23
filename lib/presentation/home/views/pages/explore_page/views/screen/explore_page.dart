import 'package:elevate_online_exams/core/di/di.dart';
import 'package:elevate_online_exams/core/resources/app_colors.dart';
import 'package:elevate_online_exams/core/resources/app_theme.dart';
import 'package:elevate_online_exams/generated/l10n.dart';
import 'package:elevate_online_exams/presentation/home/views/pages/explore_page/view_models/subject_states.dart';
import 'package:elevate_online_exams/presentation/home/views/pages/explore_page/view_models/subject_view_model.dart';
import 'package:elevate_online_exams/presentation/home/views/pages/explore_page/views/widgets/search_text_form_field.dart';
import 'package:elevate_online_exams/presentation/home/views/pages/explore_page/views/widgets/subject_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExplorePage extends StatelessWidget {
  ExplorePage({super.key});

  final SubjectViewModel subjectViewModel = getIt.get<SubjectViewModel>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 32.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            AppLocalizations.of(context).survey,
            style: AppTheme.getTextStyle(
              color: AppColors.blue,
              fontSize: 20.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 16.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SearchTextFormField(),
        ),
        SizedBox(height: 40.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text(
            AppLocalizations.of(context).browseBySubject,
            style: AppTheme.getTextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(height: 24.h),
        Expanded(
          child: BlocBuilder<SubjectViewModel, SubjectState>(
            bloc: subjectViewModel..getAllSubjects(),
            builder: (context, state) {
              if (state is SubjectStateSuccess) {
                return SubjectListView(subjects: state.subjects);
              } else if (state is SubjectStateFailure) {
                return Center(
                  child: Text(
                    state.errorMessage,
                    style: AppTheme.getTextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),
      ],
    );
  }
}
