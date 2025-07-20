import 'package:elevate_online_exams/core/resources/app_colors.dart';
import 'package:elevate_online_exams/core/resources/font_manager.dart';
import 'package:elevate_online_exams/core/resources/style_manager.dart';
import 'package:elevate_online_exams/core/route_generator/routes.dart';
import 'package:elevate_online_exams/l10n/get_translations.dart';
import 'package:flutter/material.dart';

class NotHaveAccountWidget extends StatelessWidget {
  const NotHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          getTranslations(context).notHaveAnAccount,
          style: getRegularStyle(fontSize: FontSize.s16),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.registerScreen);
          },
          child: Text(
            getTranslations(context).signUp,
            style: getRegularStyle(
              fontSize: FontSize.s16,
              color: AppColors.blue,
            ).copyWith(decoration: TextDecoration.underline),
          ),
        ),
      ],
    );
  }
}
