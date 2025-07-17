import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/data/datasource/auth_online_data_source.dart';
import 'package:elevate_online_exams/domain/model/login_model.dart';
import 'package:elevate_online_exams/domain/model/register_model.dart';
import 'package:elevate_online_exams/domain/repos/auth_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepo)
class AuthRepoImpl implements AuthRepo {
  final AuthOnlineDataSource _authOnlineDataSource;

  AuthRepoImpl(this._authOnlineDataSource);

  @override
  Future<RegisterModel> register(
    String username,
    String firstName,
    String lastName,
    String email,
    String password,
    String rePassword,
    String phone,
  ) {
    return _authOnlineDataSource.register(
      username,
      firstName,
      lastName,
      email,
      password,
      rePassword,
      phone,
    );
  }

  @override
  Future<ApiResult<LoginModel>> login(String email, String password) {
    return _authOnlineDataSource.login(email, password);
  }
}
