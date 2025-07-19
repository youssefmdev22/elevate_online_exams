import 'package:elevate_online_exams/api/model/request/login_request_model/login_request_model.dart';
import 'package:elevate_online_exams/api/web_services/web_services.dart';
import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/data/datasource/auth_online_data_source.dart';
import 'package:elevate_online_exams/domain/model/login_model.dart';
import 'package:elevate_online_exams/domain/model/register_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthOnlineDataSource)
class AuthOnlineDataSourceImpl implements AuthOnlineDataSource {
  final WebServices _webServices;

  AuthOnlineDataSourceImpl(this._webServices);

  @override
  Future<RegisterModel> register(
    String username,
    String firstName,
    String lastName,
    String email,
    String password,
    String rePassword,
    String phone,
  ) async {
    var response = await _webServices.register({
      "username": username,
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
      "rePassword": rePassword,
      "phone": phone,
    });

    return response.user!.toRegisterModel();
  }

  @override
  Future<ApiResult<LoginModel>> login(
    LoginRequestModel loginRequestModel,
  ) async {
    try {
      var response = await _webServices.login(loginRequestModel);

      return ApiSuccessResult(response.user!.toLoginModel(response.token!));
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
