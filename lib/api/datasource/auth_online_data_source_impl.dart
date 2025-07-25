import 'package:elevate_online_exams/api/model/mapper/login_mapper.dart';
import 'package:elevate_online_exams/api/model/request/login_request_model/login_request_model.dart';
import 'package:elevate_online_exams/api/model/request/register_request_model.dart';
import 'package:elevate_online_exams/api/web_services/web_services.dart';
import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/data/datasource/auth_online_data_source.dart';
import 'package:elevate_online_exams/domain/model/login_model.dart';
import 'package:elevate_online_exams/domain/model/register_model.dart';
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
      final response = await _webServices.register(registerRequestModel);
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
      var response = await _webServices.login(loginRequestModel);

      return ApiSuccessResult(
        LoginMapper.fromDto(response.user!, response.token!),
      );
    } catch (e) {
      // if (e is DioException) {
      //   String errorMessage = handleDioError(e);
      //   return ApiErrorResult(errorMessage);
      //   // return ApiErrorResult(e.message ?? e.toString());
      // }
      // return ApiErrorResult(e.toString());
      return ApiErrorResult(e);
    }
  }
}
