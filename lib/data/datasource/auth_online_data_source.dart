import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/change_password_model.dart';
import 'package:elevate_online_exams/domain/model/login_model.dart';
import 'package:elevate_online_exams/domain/model/request_model/change_password_request_model.dart';
import 'package:elevate_online_exams/domain/model/request_model/edit_profile_request_model.dart';
import 'package:elevate_online_exams/domain/model/request_model/login_request_model.dart';
import 'package:elevate_online_exams/domain/model/request_model/register_request_model.dart';
import 'package:elevate_online_exams/domain/model/user_model.dart';

import '../../domain/model/register_model.dart';

abstract interface class AuthOnlineDataSource {
  Future<ApiResult<RegisterModel>> register({
    required RegisterRequestModel registerRequestModel,
  });

  Future<ApiResult<LoginModel>> login(LoginRequestModel loginRequestModel);

  Future<ApiResult<UserModel>> getProfileData();

  Future<ApiResult<UserModel>> editProfile(
    EditProfileRequestModel editProfileRequestModel,
  );

  Future<ApiResult<ChangePasswordModel>> changePassword(
    ChangePasswordRequestModel changePasswordRequestModel,
  );
}
