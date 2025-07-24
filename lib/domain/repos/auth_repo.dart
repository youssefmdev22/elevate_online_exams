import 'package:elevate_online_exams/api/model/request/login_request_model/login_request_model.dart';
import 'package:elevate_online_exams/api/model/saved_user_credentials_model.dart';
import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/login_model.dart';
import 'package:elevate_online_exams/domain/model/register_model.dart';

abstract class AuthRepo {
  Future<RegisterModel> register(
    String username,
    String firstName,
    String lastName,
    String email,
    String password,
    String rePassword,
    String phone,
  );

  Future<ApiResult<LoginModel>> login(
    LoginRequestModel loginRequestModel, {
    required bool isCheckedRememberMe,
  });

  Future<SavedUserCredentialsModel> loadSavedUserCredentials();
}
