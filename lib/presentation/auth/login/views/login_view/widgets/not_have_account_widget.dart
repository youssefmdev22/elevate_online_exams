import 'package:elevate_online_exams/core/resources/app_colors.dart';
import 'package:elevate_online_exams/core/route_generator/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../generated/l10n.dart';

class NotHaveAccountWidget extends StatelessWidget {
  const NotHaveAccountWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context).notHaveAnAccount,
          style: Theme.of(
            context,
          ).textTheme.bodySmall?.copyWith(fontSize: 16.sp),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamed(context, Routes.registerScreen);
          },
          child: Text(
            AppLocalizations.of(context).signUp,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 16.sp,
              color: AppColors.blue,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
      ],
    );
  }
}
