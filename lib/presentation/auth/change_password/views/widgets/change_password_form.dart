import 'package:elevate_online_exams/core/app/app_validators.dart';
import 'package:elevate_online_exams/core/resources/app_colors.dart';
import 'package:elevate_online_exams/core/resources/app_theme.dart';
import 'package:elevate_online_exams/generated/l10n.dart';
import 'package:elevate_online_exams/presentation/auth/change_password/view_models/change_password_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChangePasswordForm extends StatelessWidget {
  final ChangePasswordViewModel changePasswordViewModel;
  final VoidCallback isTextChangedFunction;
  const ChangePasswordForm({
    super.key,
    required this.changePasswordViewModel,
    required this.isTextChangedFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: () {
        isTextChangedFunction();
      },
      key: changePasswordViewModel.formKey,
      autovalidateMode: AutovalidateMode.always,
      child: Column(
        children: [
          TextFormField(
            obscureText: true,
            controller: changePasswordViewModel.currentPasswordController,
            validator: AppValidators.validatePassword,
            style: Theme.of(context).textTheme.bodySmall,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context).currentPassword,
              hintStyle: AppTheme.getTextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.gray,
              ),
              labelText: AppLocalizations.of(context).currentPassword,
              labelStyle: AppTheme.getTextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.gray,
              ),
            ),
          ),
          SizedBox(height: 24.h),
          TextFormField(
            obscureText: true,
            controller: changePasswordViewModel.newPasswordController,
            validator: AppValidators.validatePassword,
            style: Theme.of(context).textTheme.bodySmall,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context).newPassword,
              hintStyle: AppTheme.getTextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.gray,
              ),
              labelText: AppLocalizations.of(context).newPassword,
              labelStyle: AppTheme.getTextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.gray,
              ),
            ),
          ),
          SizedBox(height: 24.h),
          TextFormField(
            obscureText: true,
            controller: changePasswordViewModel.confirmPasswordController,
            validator:
                (val) => AppValidators.validateConfirmPassword(
                  val,
                  changePasswordViewModel.newPasswordController.text,
                ),
            style: Theme.of(context).textTheme.bodySmall,
            decoration: InputDecoration(
              hintText: AppLocalizations.of(context).confirmPassword,
              hintStyle: AppTheme.getTextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.gray,
              ),
              labelText: AppLocalizations.of(context).confirmPassword,
              labelStyle: AppTheme.getTextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.gray,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
