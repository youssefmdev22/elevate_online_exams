import 'package:elevate_online_exams/core/app/string_format_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../generated/l10n.dart';
import '../../view_models/exam_view_model.dart';

class ExamQuestions extends StatelessWidget {
  final ExamViewModel _examViewModel;
  int questionIndex;

  ExamQuestions(this._examViewModel, this.questionIndex, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Align(
          alignment: Alignment.center,
          child: Text(
            AppLocalizations.of(context).questionOf.format([
              questionIndex + 1,
              _examViewModel.totalQuestions,
            ]),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontWeight: FontWeight.w500,
              color: AppColors.gray,
            ),
          ),
        ),
        LinearProgressIndicator(
          value: (questionIndex + 1) / _examViewModel.totalQuestions,
          backgroundColor: AppColors.black[10],
          color: AppColors.blue,
          borderRadius: BorderRadius.circular(10),
        ),
        SizedBox(height: 24.h),
        Text(
          _examViewModel.questionsList[questionIndex].question!,
          style: Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(fontSize: 18.sp),
        ),
        SizedBox(height: 24.h),
        ValueListenableBuilder(
          valueListenable: _examViewModel.answerIndex,
          builder: (_, value, child) {
            final answersList =
                _examViewModel.questionsList[questionIndex].answers!;
            return ListView.builder(
              shrinkWrap: true,
              itemCount: answersList.length,
              itemBuilder: (_, index) {
                return Card(
                  elevation: 0,
                  color:
                      index == value ? AppColors.blue[10] : AppColors.lightBlue,
                  child: RadioListTile(
                    title: Text(
                      answersList[index].answer!,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    value: index,
                    groupValue: value,
                    onChanged: (value) {
                      _examViewModel.changeSelectedAnswer(value);
                    },
                  ),
                );
              },
            );
          },
        ),
        SizedBox(height: 80.h),
        Row(
          mainAxisSize: MainAxisSize.max,
          spacing: 16.w,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  _examViewModel.previousQuestion();
                },
                style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                  backgroundColor: WidgetStateProperty.all(AppColors.white),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: Text(
                  AppLocalizations.of(context).back,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  _examViewModel.nextQuestion();
                },
                style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                child: Text(
                  questionIndex == _examViewModel.totalQuestions - 1
                      ? AppLocalizations.of(context).finish
                      : AppLocalizations.of(context).next,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
