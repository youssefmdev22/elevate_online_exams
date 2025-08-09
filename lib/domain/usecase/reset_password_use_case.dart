import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/request_model/reset_password_request_model.dart';
import 'package:elevate_online_exams/domain/model/reset_password_model.dart';
import 'package:elevate_online_exams/domain/repos/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ResetPasswordUseCase {
  final AuthRepo _authRepo;
  ResetPasswordUseCase(this._authRepo);

  Future<ApiResult<ResetPasswordModel>> call(ResetPasswordRequestModel resetPasswordRequestModel,
  ) {
    return _authRepo.resetPassword(resetPasswordRequestModel);
  }
}
