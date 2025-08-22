import 'package:elevate_online_exams/core/di/di.dart';
import 'package:elevate_online_exams/core/resources/app_colors.dart';
import 'package:elevate_online_exams/core/resources/app_theme.dart';
import 'package:elevate_online_exams/core/route_generator/routes.dart';
import 'package:elevate_online_exams/generated/l10n.dart';
import 'package:elevate_online_exams/presentation/auth/forget_password/view_models/verify_reset_code_view_model/verify_reset_code_states.dart';
import 'package:elevate_online_exams/presentation/auth/forget_password/view_models/verify_reset_code_view_model/verify_reset_code_view_model.dart';
import 'package:elevate_online_exams/presentation/auth/forget_password/views/widgets/reset_password_custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyResetCodeScreen extends StatefulWidget {
  const VerifyResetCodeScreen({super.key});

  @override
  State<VerifyResetCodeScreen> createState() => _VerifyResetCodeScreenState();
}


class _VerifyResetCodeScreenState extends State<VerifyResetCodeScreen> {

  @override
  void initState() {
    super.initState();
    showError = false;
  }

  final VerifyResetCodeViewModel verifyResetCodeViewModel =
      getIt.get<VerifyResetCodeViewModel>();

  bool showError = false;

  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context)!.settings.arguments as String;
    return BlocConsumer<VerifyResetCodeViewModel, VerifyResetCodeState>(
      bloc: verifyResetCodeViewModel,
      listener: (context, state) {
        if (state is VerifyResetCodeStateSuccess) {
          Navigator.of(context, rootNavigator: true).pop();
          Navigator.pushNamed(context, Routes.resetPasswordScreen,arguments: email,);
        } else if (state is VerifyResetCodeStateLoading) {
          showDialog(
            context: context,
            builder: (_) {
              return Center(child: CircularProgressIndicator());
            },
          );
        } else {
          Navigator.of(context, rootNavigator: true).pop();
          setState(() {
            showError = true;
          });
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    SizedBox(height: 16.h),
                    ResetPasswordCustomAppBar(),
                    SizedBox(height: 40.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 34.w),
                      child: SizedBox(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              AppLocalizations.of(context).emailVerification,
                              style: AppTheme.getTextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              AppLocalizations.of(
                                context,
                              ).pleaseEnterYourCodeThatSendToYourEmailAddress,
                              style: AppTheme.getTextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.gray,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 32.h),
                    PinCodeTextField(
                      onCompleted: (value) {
                        verifyResetCodeViewModel.verifyResetCode();
                      },
                      appContext: context,
                      length: 6,
                      controller: verifyResetCodeViewModel.resetCodeController,
                      enableActiveFill: true,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(10.r),
                        activeColor: AppColors.pinCodeTextFiledColor,
                        activeFillColor: AppColors.pinCodeTextFiledColor,
                        inactiveColor: AppColors.red,
                        inactiveFillColor: AppColors.white,
                        selectedColor: AppColors.pinCodeTextFiledColor,
                        selectedFillColor: AppColors.pinCodeTextFiledColor,
                      ),
                    ),
                    if (showError)
                      Column(
                        children: [
                          SizedBox(height: 8.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Icon(
                                Icons.error_outline,
                                color: AppColors.red,
                                size: 13,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                AppLocalizations.of(context).invalidCode,
                                style: AppTheme.getTextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w300,
                                  color: AppColors.red,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    SizedBox(height: 32.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context).didntReceiveCode,
                          style: AppTheme.getTextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            verifyResetCodeViewModel.resendResetCode(email);
                          },
                          child: Text(
                            AppLocalizations.of(context).resend,
                            style: AppTheme.getTextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: AppColors.blue,
                            ).copyWith(decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
