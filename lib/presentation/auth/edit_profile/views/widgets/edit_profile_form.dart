import 'package:elevate_online_exams/core/app/app_validators.dart';
import 'package:elevate_online_exams/core/resources/app_colors.dart';
import 'package:elevate_online_exams/core/resources/app_theme.dart';
import 'package:elevate_online_exams/core/route_generator/routes.dart';
import 'package:elevate_online_exams/generated/l10n.dart';
import 'package:elevate_online_exams/presentation/auth/edit_profile/view_models/edit_profile_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileForm extends StatelessWidget {
  final EditProfileViewModel editProfileViewModel;
  final VoidCallback isTextFieldChangedFunction;
  const EditProfileForm({
    super.key,
    required this.editProfileViewModel,
    required this.isTextFieldChangedFunction,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      onChanged: () {
        isTextFieldChangedFunction();
      },
      autovalidateMode: AutovalidateMode.always,
      key: editProfileViewModel.formKey,
      child: Column(
        children: [
          TextFormField(
            controller: editProfileViewModel.userNameController,
            style: Theme.of(context).textTheme.bodySmall,
            validator: AppValidators.validateUsername,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context).userName,
              labelStyle: AppTheme.getTextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.gray,
              ),
            ),
          ),
          SizedBox(height: 24.h),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: editProfileViewModel.firstNameController,
                  style: Theme.of(context).textTheme.bodySmall,
                  validator: AppValidators.validateFullName,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).firstName,
                    labelStyle: AppTheme.getTextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.gray,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 17.w),
              Expanded(
                child: TextFormField(
                  controller: editProfileViewModel.lastNameController,
                  style: Theme.of(context).textTheme.bodySmall,
                  validator: AppValidators.validateFullName,
                  decoration: InputDecoration(
                    labelText: AppLocalizations.of(context).lastName,
                    labelStyle: AppTheme.getTextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.gray,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 24.h),
          TextFormField(
            controller: editProfileViewModel.emailController,
            style: Theme.of(context).textTheme.bodySmall,
            validator: AppValidators.validateEmail,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context).email,
              labelStyle: AppTheme.getTextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.gray,
              ),
            ),
          ),
          SizedBox(height: 24.h),
          TextFormField(
            initialValue: "00000000",
            obscureText: true,
            obscuringCharacter: "*",
            readOnly: true,
            style: Theme.of(context).textTheme.bodySmall,
            decoration: InputDecoration(
              suffixIcon: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.changePasswordScreen);
                },
                child: Text(
                  AppLocalizations.of(context).change,
                  style: AppTheme.getTextStyle(
                    color: AppColors.blue,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              labelText: AppLocalizations.of(context).password,
              labelStyle: AppTheme.getTextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.gray,
              ),
            ),
          ),
          SizedBox(height: 24.h),
          TextFormField(
            controller: editProfileViewModel.phoneNumberController,
            style: Theme.of(context).textTheme.bodySmall,
            validator: AppValidators.validatePhoneNumber,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context).phoneNumber,
              labelStyle: AppTheme.getTextStyle(
                fontSize: 16.sp,
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
