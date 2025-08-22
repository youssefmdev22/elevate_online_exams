import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/forget_password_model.dart';
import 'package:elevate_online_exams/domain/model/request_model/forget_password_request_model.dart';
import 'package:elevate_online_exams/domain/repos/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ForgetPasswordUseCase {
  final AuthRepo _authRepo;
  ForgetPasswordUseCase(this._authRepo);

  Future<ApiResult<ForgetPasswordModel>> call(
    ForgetPasswordRequestModel forgetPasswordRequestModel,
  ) {
    return _authRepo.forgetPassword(forgetPasswordRequestModel);
  }
}
