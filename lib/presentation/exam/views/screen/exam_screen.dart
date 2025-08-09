import 'package:elevate_online_exams/core/resources/app_assets.dart';
import 'package:elevate_online_exams/core/resources/app_colors.dart';
import 'package:elevate_online_exams/domain/model/exam_model.dart';
import 'package:elevate_online_exams/presentation/exam/view_models/exam_view_model.dart';
import 'package:elevate_online_exams/presentation/exam/views/widgets/exam_questions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/custom_widget/custom_dialog.dart';
import '../../../../core/di/di.dart';
import '../../../../generated/l10n.dart';
import '../widgets/exam_score.dart';
import '../widgets/exam_timeout_dialog.dart';

class ExamScreen extends StatefulWidget {
  final ExamModel examModel;

  const ExamScreen({super.key, required this.examModel});

  @override
  State<ExamScreen> createState() => _ExamScreenState();
}

class _ExamScreenState extends State<ExamScreen> {
  late final ExamViewModel _examViewModel;

  @override
  void initState() {
    super.initState();
    _examViewModel = getIt<ExamViewModel>();
    _examViewModel.examModel = widget.examModel;
    _examViewModel.getAllExamQuestions();
  }

  @override
  void dispose() {
    _examViewModel.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(AppLocalizations.of(context).exam),
        actions: [
          Image.asset(ImageAssets.clockImage),
          SizedBox(width: 8.w),
          ValueListenableBuilder(
            valueListenable: _examViewModel.timerValue,
            builder: (_, value, child) {
              return Text(
                value,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.w400,
                  color:
                      _examViewModel.isDangerTime()
                          ? AppColors.green
                          : AppColors.red,
                ),
              );
            },
          ),
          SizedBox(width: 16.w),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: BlocConsumer<ExamViewModel, ExamState>(
          bloc: _examViewModel,
          listener: (context, state) {
            switch (state) {
              case ExamInitial():
                break;
              case ExamLoading():
                break;
              case ExamSuccess():
                break;
              case ExamError():
                CustomDialog.positiveButton(
                  context: context,
                  title: AppLocalizations.of(context).error,
                  message: state.errorMessage,
                );
                break;
              case ExamTimeout():
                ExamTimeoutDialog(
                  context: context,
                  onPressed: () {
                    Navigator.of(context).pop();
                    _examViewModel.checkExamQuestions();
                  },
                );
                break;
              case ExamCheckQuestions():
                break;
            }
          },
          buildWhen: (previous, current) {
            return current is ExamLoading ||
                current is ExamSuccess ||
                current is ExamCheckQuestions ||
                current is ExamError;
          },
          builder: (context, state) {
            if (state is ExamSuccess) {
              return ValueListenableBuilder(
                valueListenable: _examViewModel.questionIndex,
                builder: (_, value, child) {
                  return ExamQuestions(_examViewModel, value);
                },
              );
            }
            if (state is ExamCheckQuestions) {
              return ExamScoreScreen(
                checkQuestionsData: state.checkQuestionsData,
                examViewModel: _examViewModel,
              );
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
