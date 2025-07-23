import 'package:elevate_online_exams/core/resources/app_colors.dart';
import 'package:elevate_online_exams/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchTextFormField extends StatelessWidget {
  SearchTextFormField({super.key});
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchController,
      style: Theme.of(context).textTheme.bodySmall,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search, color: AppColors.gray, size: 24),
        hintText: AppLocalizations.of(context).search,
        border: (Theme.of(context).inputDecorationTheme.border
                as OutlineInputBorder)
            .copyWith(borderRadius: BorderRadius.circular(20.r)),
        focusedBorder: (Theme.of(context).inputDecorationTheme.border
                as OutlineInputBorder)
            .copyWith(borderRadius: BorderRadius.circular(20.r)),
        enabledBorder: (Theme.of(context).inputDecorationTheme.border
                as OutlineInputBorder)
            .copyWith(borderRadius: BorderRadius.circular(20.r)),
      ),
    );
  }
}
