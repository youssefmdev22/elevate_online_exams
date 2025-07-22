import 'package:elevate_online_exams/api/model/request/login_request_model/login_request_model.dart';
import 'package:elevate_online_exams/api/model/saved_user_credentials_model.dart';
import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/data/datasource/auth_offline_data_source.dart';
import 'package:elevate_online_exams/data/datasource/auth_online_data_source.dart';
import 'package:elevate_online_exams/domain/model/login_model.dart';
import 'package:elevate_online_exams/domain/model/register_model.dart';
import 'package:elevate_online_exams/domain/repos/auth_repo.dart';
import 'package:injectable/injectable.dart';

import '../../api/model/request/register_request_model.dart';

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
}
