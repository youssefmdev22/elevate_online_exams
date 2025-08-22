import 'package:elevate_online_exams/core/route_generator/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../generated/l10n.dart';

class CustomLoginAppbar extends StatelessWidget {
  const CustomLoginAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: (){
            Navigator.pushNamed(context, Routes.registerScreen);
          },
          child: const Icon(Icons.arrow_back_ios)),
        SizedBox(width: 8.w),
        Text(
          AppLocalizations.of(context).login,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
