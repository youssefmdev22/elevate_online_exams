import 'package:elevate_online_exams/api/model/request/login_request_model/login_request_model.dart';
import 'package:elevate_online_exams/api/model/request/register_request_model.dart';
import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/login_model.dart';

import '../../domain/model/register_model.dart';

abstract class AuthOnlineDataSource {
  Future<ApiResult<RegisterModel>> register({
    required RegisterRequestModel registerRequestModel,
  });

  Future<ApiResult<LoginModel>> login(LoginRequestModel loginRequestModel);
}
