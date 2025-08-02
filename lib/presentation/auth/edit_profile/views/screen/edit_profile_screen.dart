import 'package:elevate_online_exams/core/di/di.dart';
import 'package:elevate_online_exams/core/resources/app_colors.dart';
import 'package:elevate_online_exams/core/resources/app_theme.dart';
import 'package:elevate_online_exams/generated/l10n.dart';
import 'package:elevate_online_exams/presentation/auth/edit_profile/view_models/edit_profile_states.dart';
import 'package:elevate_online_exams/presentation/auth/edit_profile/view_models/edit_profile_view_model.dart';
import 'package:elevate_online_exams/presentation/auth/edit_profile/views/widgets/edit_profile_form.dart';
import 'package:elevate_online_exams/presentation/auth/edit_profile/views/widgets/profile_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final EditProfileViewModel editProfileViewModel =
      getIt.get<EditProfileViewModel>();
  @override
  void initState() {
    super.initState();
    editProfileViewModel.getProfileData();
  }

  bool isTextFieldChanged = false;
  void isTextFieldChangedFunction() {
    setState(() {
      isTextFieldChanged = true;
    });
  }

  bool get isValid =>
      editProfileViewModel.formKey.currentState?.validate() ?? false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EditProfileViewModel, EditProfileState>(
      bloc: editProfileViewModel,
      listener: (context, state) {
        if (state is EditProfileStateSuccessStatus) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) {
              return AlertDialog(
                title: Center(
                  child: Text(AppLocalizations.of(context).profileUpdatedSuccessfully),
                ),
                actions: [
                  TextButton(
                    onPressed: () async {
                      Navigator.maybePop(context);
                    },
                    child: Text(AppLocalizations.of(context).close),
                  ),
                ],
              );
            },
          );
        }
      },
      builder: (context, state) {
        if (state is EditProfileStateSuccess) {
          return SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 32.h),
                  Text(
                    AppLocalizations.of(context).editProfile,
                    style: AppTheme.getTextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 24.h),
                  ProfileImageWidget(),
                  SizedBox(height: 24.h),
                  EditProfileForm(
                    editProfileViewModel: editProfileViewModel,
                    isTextFieldChangedFunction: isTextFieldChangedFunction,
                  ),
                  SizedBox(height: 48.h),
                  SizedBox(
                    height: 48.h,
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            isTextFieldChanged && isValid
                                ? AppColors.blue
                                : AppColors.gray,
                      ),
                      onPressed: () {
                        isTextFieldChanged && isValid
                            ? editProfileViewModel.editProfile()
                            : null;
                      },
                      child: Text(
                        AppLocalizations.of(context).update,
                        style: AppTheme.getTextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else if (state is EditProfileStateFailure) {
          return Center(
            child: Text(
              state.errorMessage,
              style: AppTheme.getTextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
              ),
            ),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
