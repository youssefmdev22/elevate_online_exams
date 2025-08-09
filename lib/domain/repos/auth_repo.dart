import 'package:elevate_online_exams/api/model/saved_user_credentials_model.dart';
import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/change_password_model.dart';
import 'package:elevate_online_exams/domain/model/forget_password_model.dart';
import 'package:elevate_online_exams/domain/model/login_model.dart';
import 'package:elevate_online_exams/domain/model/register_model.dart';
import 'package:elevate_online_exams/domain/model/request_model/change_password_request_model.dart';
import 'package:elevate_online_exams/domain/model/request_model/edit_profile_request_model.dart';
import 'package:elevate_online_exams/domain/model/request_model/forget_password_request_model.dart';
import 'package:elevate_online_exams/domain/model/request_model/login_request_model.dart';
import 'package:elevate_online_exams/domain/model/request_model/register_request_model.dart';
import 'package:elevate_online_exams/domain/model/request_model/reset_password_request_model.dart';
import 'package:elevate_online_exams/domain/model/request_model/verify_reset_code_request_model.dart';
import 'package:elevate_online_exams/domain/model/reset_password_model.dart';
import 'package:elevate_online_exams/domain/model/user_model.dart';
import 'package:elevate_online_exams/domain/model/verify_reset_code_model.dart';

abstract interface class AuthRepo {
  Future<ApiResult<RegisterModel>> register({
    required RegisterRequestModel registerRequestModel,
  });

  Future<ApiResult<LoginModel>> login(
    LoginRequestModel loginRequestModel, {
    required bool isCheckedRememberMe,
  });

  Future<SavedUserCredentialsModel> loadSavedUserCredentials();

  Future<ApiResult<UserModel>> getProfileData();

  Future<ApiResult<UserModel>> editProfile(
    EditProfileRequestModel editProfileRequestModel,
  );

  Future<ApiResult<ChangePasswordModel>> changePassword(
    ChangePasswordRequestModel changePasswordRequestModel,
  );

  Future<ApiResult<ForgetPasswordModel>> forgetPassword(
    ForgetPasswordRequestModel forgetPasswordRequestModel,
  );

  Future<ApiResult<VerifyResetCodeModel>> verifyResetCode(
    VerifyResetCodeRequestModel verifyResetCodeRequestModel,
  );

  Future<ApiResult<ResetPasswordModel>> resetPassword(
    ResetPasswordRequestModel resetPasswordRequestModel,
  );
}
