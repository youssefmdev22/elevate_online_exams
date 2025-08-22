import 'package:elevate_online_exams/api/model/saved_user_credentials_model.dart';
import 'package:elevate_online_exams/domain/model/request_model/login_request_model.dart';

abstract interface class AuthOfflineDataSource {

  Future<void> saveUserCredential(LoginRequestModel loginRequestModel);

  Future<void> clearUserCredential();

  Future<void> saveUserToken(String token);

  Future<SavedUserCredentialsModel> loadSavedUserCredentials();
  
  Future<void> removeUserToken();

}
