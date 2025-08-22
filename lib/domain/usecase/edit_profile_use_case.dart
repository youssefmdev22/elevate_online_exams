import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/request_model/edit_profile_request_model.dart';
import 'package:elevate_online_exams/domain/model/user_model.dart';
import 'package:elevate_online_exams/domain/repos/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class EditProfileUseCase {
  final AuthRepo _authRepo;
  EditProfileUseCase(this._authRepo);

  Future<ApiResult<UserModel>> call(EditProfileRequestModel editProfileRequestModel,
  ) {
    return _authRepo.editProfile(editProfileRequestModel);
  }
}
