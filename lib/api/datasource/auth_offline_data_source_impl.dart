import 'package:elevate_online_exams/api/model/saved_user_credentials_model.dart';
import 'package:elevate_online_exams/core/app/constants.dart';
import 'package:elevate_online_exams/core/app/shared_prefs.dart';
import 'package:elevate_online_exams/data/datasource/auth_offline_data_source.dart';
import 'package:elevate_online_exams/domain/model/request_model/login_request_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthOfflineDataSource)
class AuthOfflineDataSourceImpl implements AuthOfflineDataSource {
  @override
  Future<void> saveUserCredential(LoginRequestModel loginRequestModel) async {
    await SharedPrefs.saveData(Constants.rememberMe, true);
    await SharedPrefs.saveData(Constants.email, loginRequestModel.email);
    await SharedPrefs.saveData(Constants.password, loginRequestModel.password);
  }

  @override
  Future<void> clearUserCredential() async {
    await SharedPrefs.removeData(Constants.rememberMe);
    await SharedPrefs.removeData(Constants.email);
    await SharedPrefs.removeData(Constants.password);
  }

  @override
  Future<void> saveUserToken(String token) async {
    await SharedPrefs.saveData(Constants.tokenKey, token);
  }

  @override
  Future<SavedUserCredentialsModel> loadSavedUserCredentials() async {
    final isRemembered =
        await SharedPrefs.getData(Constants.rememberMe) ?? false;
    if (isRemembered == true) {
      final savedEmail = await SharedPrefs.getData(Constants.email);
      final savedPassword = await SharedPrefs.getData(Constants.password);
      return SavedUserCredentialsModel(
        isRemembered: true,
        email: savedEmail,
        password: savedPassword,
      );
    } else {
      return SavedUserCredentialsModel(
        isRemembered: false,
        email: null,
        password: null,
      );
    }
  }

  @override
  Future<void> removeUserToken() async {
    await SharedPrefs.removeData(Constants.tokenKey);
  }
}
