import 'package:elevate_online_exams/domain/model/questions_model.dart';
import 'package:elevate_online_exams/presentation/answers/views/widget/answers_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../generated/l10n.dart';

class AnswersScreen extends StatelessWidget {
  final List<QuestionsModel> questionsList;

  const AnswersScreen({super.key, required this.questionsList});

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
        title: Text(AppLocalizations.of(context).answers),
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 24.h),
        itemCount: questionsList.length,
        itemBuilder: (_, index) {
          return Card(
            margin: EdgeInsets.all(16.w),
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.all(8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                spacing: 16.h,
                children: [
                  Text(
                    questionsList[index].question!,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(fontSize: 18.sp),
                  ),
                  AnswersItem(questionsData: questionsList[index]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
