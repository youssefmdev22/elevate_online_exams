import 'package:elevate_online_exams/core/app/string_format_extension.dart';
import 'package:elevate_online_exams/core/resources/app_assets.dart';
import 'package:elevate_online_exams/core/resources/app_colors.dart';
import 'package:elevate_online_exams/core/route_generator/routes.dart';
import 'package:elevate_online_exams/domain/model/result_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../generated/l10n.dart';

class ResultItem extends StatelessWidget {
  final ResultModel resultData;

  const ResultItem({super.key, required this.resultData});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.answersScreen,
          arguments: resultData.questionsList,
        );
      },
      child: Card(
        elevation: 4,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            spacing: 8.w,
            children: [
              Image.asset(ImageAssets.profitImage),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    spacing: 50.w,
                    children: [
                      Text(
                        resultData.examModel?.title ?? "",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        "${resultData.examModel?.duration.toString() ?? "00"} ${AppLocalizations.of(context).minutes}",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                  Text(
                    "${resultData.examModel?.numberOfQuestions.toString() ?? "0"} ${AppLocalizations.of(context).question}",
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: AppColors.gray),
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    AppLocalizations.of(context).correctedAnswersInfo.format([
                      resultData.correctAnswers,
                      resultData.examTime,
                    ]),
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: AppColors.blue),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
