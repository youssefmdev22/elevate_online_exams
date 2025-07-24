import 'package:elevate_online_exams/core/di/di.dart';
import 'package:elevate_online_exams/core/resources/app_theme.dart';
import 'package:elevate_online_exams/presentation/subject_exams/view_models/subject_exams_states.dart';
import 'package:elevate_online_exams/presentation/subject_exams/view_models/subject_exams_view_model.dart';
import 'package:elevate_online_exams/presentation/subject_exams/views/widgets/custom_app_bar.dart';
import 'package:elevate_online_exams/presentation/subject_exams/views/widgets/subject_exams_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubjectExamsScreen extends StatelessWidget {
  SubjectExamsScreen({super.key});

  final SubjectExamsViewModel subjectExamsViewModel =
      getIt.get<SubjectExamsViewModel>();

  @override
  Widget build(BuildContext context) {
    var argument =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    String subjectName = argument['name'];
    String subjectId = argument['id'];
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.w),
              child: CustomAppBar(subjectName: subjectName),
            ),
            SizedBox(height: 16.h),
            Expanded(
              child: BlocBuilder<SubjectExamsViewModel, SubjectExamsState>(
                bloc: subjectExamsViewModel..getAllSubjectExams(subjectId),
                builder: (context, state) {
                  if (state is SubjectExamsStateSuccess) {
                    return SubjectExamsListView(
                      subjectExams: state.subjectExams , subjectName: subjectName);
                  } else if (state is SubjectExamsStateFailure) {
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
        ),
      ),
    );
  }
}
