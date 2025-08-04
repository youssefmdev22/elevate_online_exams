import 'package:elevate_online_exams/api/model/mapper/login_mapper.dart';
import 'package:elevate_online_exams/api/model/request/change_password_request_dto/change_password_request_dto.dart';
import 'package:elevate_online_exams/api/model/request/edit_profile_request_dto/edit_profile_request_dto.dart';
import 'package:elevate_online_exams/api/model/request/forget_password_request_dto/forget_password_request_dto.dart';
import 'package:elevate_online_exams/api/model/request/login_request_dto/login_request_dto.dart';
import 'package:elevate_online_exams/api/model/request/register_request_dto/register_request_dto.dart';
import 'package:elevate_online_exams/api/model/request/reset_password_request_dto/reset_password_request_dto.dart';
import 'package:elevate_online_exams/api/model/request/verify_reset_code_request_dto/verify_reset_code_request_dto.dart';
import 'package:elevate_online_exams/api/web_services/web_services.dart';
import 'package:elevate_online_exams/core/api_result/api_result.dart';
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
import 'package:injectable/injectable.dart';

@Injectable(as: AuthOnlineDataSource)
class AuthOnlineDataSourceImpl implements AuthOnlineDataSource {
  final WebServices _webServices;

  const AuthOnlineDataSourceImpl(this._webServices);

  @override
  Future<ApiResult<RegisterModel>> register({
    required RegisterRequestModel registerRequestModel,
  }) async {
    try {
      final response = await _webServices.register(
        RegisterRequestDto.fromDomain(registerRequestModel),
      );
      return ApiSuccessResult(response.user!.toRegisterModel());
    } catch (e) {
      return ApiErrorResult(e);
    }
  }

  @override
  Future<ApiResult<LoginModel>> login(
    LoginRequestModel loginRequestModel,
  ) async {
    try {
      var response = await _webServices.login(
        LoginRequestDto.fromDomain(loginRequestModel),
      );

      return ApiSuccessResult(
        LoginMapper.fromDto(response.user!, response.token!),
      );
    } catch (e) {
      return ApiErrorResult(e);
    }
  }

  @override
  Future<ApiResult<UserModel>> getProfileData() async {
    try {
      var response = await _webServices.getProfileData();
      return ApiSuccessResult(response.user!.toUserModel());
    } catch (e) {
      return ApiErrorResult(e);
    }
  }

  @override
  Future<ApiResult<UserModel>> editProfile(
    EditProfileRequestModel editProfileRequestModel,
  ) async {
    try {
      var response = await _webServices.editProfile(
        EditProfileRequestDto.fromDomain(editProfileRequestModel),
      );
      return ApiSuccessResult(response.user!.toUserModel());
    } catch (e) {
      return ApiErrorResult(e);
    }
  }

  @override
  Future<ApiResult<ChangePasswordModel>> changePassword(
    ChangePasswordRequestModel changePasswordRequestModel,
  ) async {
    try {
      var response = await _webServices.changePassword(
        ChangePasswordRequestDto.fromDomain(changePasswordRequestModel),
      );
      return ApiSuccessResult(response.toChangePasswordModel());
    } catch (e) {
      return ApiErrorResult(e);
    }
  }

  @override
  Future<ApiResult<ForgetPasswordModel>> forgetPassword(ForgetPasswordRequestModel forgetPasswordRequestModel,
  ) async {
    try {
      var response = await _webServices.forgetPassword(ForgetPasswordRequestDto.fromDomain(forgetPasswordRequestModel));
      return ApiSuccessResult(response.toForgetPasswordModel());
    } catch (e) {
      return ApiErrorResult(e);
    }
  }

  @override
  Future<ApiResult<VerifyResetCodeModel>> verifyResetCode(
    VerifyResetCodeRequestModel verifyResetCodeRequestModel,
  ) async {
    try {
      var response = await _webServices.verifyResetCode(VerifyResetCodeRequestDto.fromDomain(verifyResetCodeRequestModel));
      return ApiSuccessResult(response.toverifyResetCodeModel());
    } catch (e) {
      return ApiErrorResult(e);
    }
  }

  @override
  Future<ApiResult<ResetPasswordModel>> resetPassword(
    ResetPasswordRequestModel resetPasswordRequestModel,
  ) async {
    try {
      var response = await _webServices.resetPassword(
        ResetPasswordRequestDto.fromDomain(resetPasswordRequestModel),
      );
      return ApiSuccessResult(response.toResetPasswordModel());
    } catch (e) {
      return ApiErrorResult(e);
    }
  }
}
