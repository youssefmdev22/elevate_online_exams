import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/request_model/verify_reset_code_request_model.dart';
import 'package:elevate_online_exams/domain/model/verify_reset_code_model.dart';
import 'package:elevate_online_exams/domain/repos/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class VerifyResetCodeUseCase {
  final AuthRepo _authRepo;
  VerifyResetCodeUseCase(this._authRepo);

  Future<ApiResult<VerifyResetCodeModel>> call(
    VerifyResetCodeRequestModel verifyResetCodeRequestModel,
  ) {
    return _authRepo.verifyResetCode(verifyResetCodeRequestModel);
  }
}
