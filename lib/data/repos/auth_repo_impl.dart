import 'package:elevate_online_exams/api/model/saved_user_credentials_model.dart';
import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/data/datasource/auth_offline_data_source.dart';
import 'package:elevate_online_exams/data/datasource/auth_online_data_source.dart';
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
import 'package:elevate_online_exams/domain/repos/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthOnlineDataSource _authOnlineDataSource;
  final AuthOfflineDataSource _authOfflineDataSource;

  const AuthRepoImpl(this._authOnlineDataSource, this._authOfflineDataSource);

  @override
  Future<ApiResult<RegisterModel>> register({
    required RegisterRequestModel registerRequestModel,
  }) {
    return _authOnlineDataSource.register(
      registerRequestModel: registerRequestModel,
    );
  }

  @override
  Future<ApiResult<LoginModel>> login(
    LoginRequestModel loginRequestModel, {
    required bool isCheckedRememberMe,
  }) async {
    var result = await _authOnlineDataSource.login(loginRequestModel);
    switch (result) {
      case ApiSuccessResult<LoginModel>():
        await _authOfflineDataSource.saveUserToken(result.data.token!);
        if (isCheckedRememberMe) {
          await _authOfflineDataSource.saveUserCredential(loginRequestModel);
        } else {
          await _authOfflineDataSource.clearUserCredential();
        }
        break;
      default:
        break;
    }

    return result;
  }

  @override
  Future<SavedUserCredentialsModel> loadSavedUserCredentials() {
    return _authOfflineDataSource.loadSavedUserCredentials();
  }

  @override
  Future<ApiResult<UserModel>> getProfileData() {
    return _authOnlineDataSource.getProfileData();
  }

  @override
  Future<ApiResult<UserModel>> editProfile(
    EditProfileRequestModel editProfileRequestModel,
  ) {
    return _authOnlineDataSource.editProfile(editProfileRequestModel);
  }

  @override
  Future<ApiResult<ChangePasswordModel>> changePassword(
    ChangePasswordRequestModel changePasswordRequestModel,
  ) async {
    var result = await _authOnlineDataSource.changePassword(
      changePasswordRequestModel,
    );
    switch (result) {
      case ApiSuccessResult<ChangePasswordModel>():
        await _authOfflineDataSource.removeUserToken();
        break;
      default:
        break;
    }
    return result;
  }

  @override
  Future<ApiResult<ForgetPasswordModel>> forgetPassword(ForgetPasswordRequestModel forgetPasswordRequestModel) {
    return _authOnlineDataSource.forgetPassword(forgetPasswordRequestModel);
  }

  @override
  Future<ApiResult<VerifyResetCodeModel>> verifyResetCode(
    VerifyResetCodeRequestModel verifyResetCodeRequestModel,
  ) {
    return _authOnlineDataSource.verifyResetCode(verifyResetCodeRequestModel);
  }

  @override
  Future<ApiResult<ResetPasswordModel>> resetPassword(
    ResetPasswordRequestModel resetPasswordRequestModel,
  ) async {
    var result = await _authOnlineDataSource.resetPassword(
      resetPasswordRequestModel,
    );
    switch (result) {
      case ApiSuccessResult<ResetPasswordModel>():
        await _authOfflineDataSource.removeUserToken();
        break;
      default:
        break;
    }
    return result;
  }
}
