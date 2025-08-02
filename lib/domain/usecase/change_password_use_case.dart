import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/change_password_model.dart';
import 'package:elevate_online_exams/domain/model/request_model/change_password_request_model.dart';
import 'package:elevate_online_exams/domain/repos/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ChangePasswordUseCase {
  final AuthRepo _authRepo;
  const ChangePasswordUseCase(this._authRepo);

  Future<ApiResult<ChangePasswordModel>> call(
    ChangePasswordRequestModel changePasswordRequestModel,
  ) {
    return _authRepo.changePassword(changePasswordRequestModel);
  }
}
