import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/user_model.dart';
import 'package:elevate_online_exams/domain/repos/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetProfileDataUseCase {
  final AuthRepo _authRepo;
  GetProfileDataUseCase(this._authRepo);

  Future<ApiResult<UserModel>> call() {
    return _authRepo.getProfileData();
  }
}
