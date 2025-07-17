import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/login_model.dart';
import 'package:elevate_online_exams/domain/repos/auth_repo.dart';
import 'package:injectable/injectable.dart';



@injectable
class LoginUseCase {
  final AuthRepo _authRepo;
  LoginUseCase(this._authRepo);

  Future<ApiResult<LoginModel>> call(String email, String password) {
    return _authRepo.login(email, password);
  }
}
