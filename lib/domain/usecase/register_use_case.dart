import 'package:elevate_online_exams/domain/model/request_model/register_request_model.dart';
import 'package:elevate_online_exams/domain/repos/auth_repo.dart';
import 'package:injectable/injectable.dart';
import '../../core/api_result/api_result.dart';
import '../model/register_model.dart';

@injectable
class RegisterUseCase {
  final AuthRepo _authRepo;

  const RegisterUseCase(this._authRepo);

  Future<ApiResult<RegisterModel>> call({
    required RegisterRequestModel registerRequestModel,
  }) {
    return _authRepo.register(registerRequestModel: registerRequestModel);
  }
}
