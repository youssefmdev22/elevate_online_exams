import 'package:elevate_online_exams/api/model/request/login_request_model/login_request_model.dart';
import 'package:elevate_online_exams/api/model/saved_user_credentials_model.dart';
import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/login_model.dart';
import 'package:elevate_online_exams/domain/model/register_model.dart';

import '../../api/model/request/register_request_model.dart';

abstract interface class AuthRepo {
  Future<ApiResult<RegisterModel>> register({
    required RegisterRequestModel registerRequestModel,
  });

  Future<ApiResult<LoginModel>> login(
    LoginRequestModel loginRequestModel, {
    required bool isCheckedRememberMe,
  });

  Future<SavedUserCredentialsModel> loadSavedUserCredentials();
}
