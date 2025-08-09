import 'package:elevate_online_exams/domain/model/questions_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resources/app_colors.dart';

class AnswersItem extends StatelessWidget {
  final QuestionsModel questionsData;

  const AnswersItem({super.key, required this.questionsData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: questionsData.answers!.length,
      itemBuilder: (_, index) {
        return Column(
          children: [
            Card(
              color: getColor(index, false),
              child: Row(
                children: [
                  Checkbox(
                    checkColor: AppColors.white,
                    fillColor: WidgetStateProperty.all(getColor(index, true)),
                    value: isChecked(index),
                    onChanged: (_){},
                  ),
                  Text(
                    questionsData.answers![index].answer!,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            SizedBox(height: 8.h),
          ],
        );
      },
    );
  }

  bool isChecked(int index) {
    if (questionsData.selectedAnswer != null &&
        index == questionsData.selectedAnswer) {
      return true;
    }
    String correct = questionsData.correct!.replaceAll("A", "");
    int correctAnswer = int.parse(correct) - 1;
    return index == correctAnswer;
  }

  Color getColor(int index, bool isFill) {
    String correct = questionsData.correct!.replaceAll("A", "");
    int correctAnswer = int.parse(correct) - 1;

    if (index == correctAnswer) {
      return isFill ? AppColors.green : AppColors.lightGreen;
    }
    if (questionsData.selectedAnswer != null &&
        index == questionsData.selectedAnswer &&
        questionsData.selectedAnswer != correctAnswer) {
      return isFill ? AppColors.red : AppColors.lightRed;
    }
    return isFill ? AppColors.white : AppColors.lightBlue;
  }
}
