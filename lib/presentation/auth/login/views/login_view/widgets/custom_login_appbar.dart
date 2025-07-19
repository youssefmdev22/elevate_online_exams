import 'package:elevate_online_exams/core/resources/app_theme.dart';
import 'package:elevate_online_exams/l10n/get_translations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomLoginAppbar extends StatelessWidget {
  const CustomLoginAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return   Row(
              children: [
                const Icon(Icons.arrow_back_ios),
                SizedBox(width: 8.w,),
                Text( getTranslations(context).login, style: AppTheme.getInterTextStyle(fontSize: 20.sp, fontWeight: FontWeight.w500),)
              ],
            );
  }
}