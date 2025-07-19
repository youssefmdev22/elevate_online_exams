import 'package:elevate_online_exams/api/model/saved_user_credentials_model.dart';
import 'package:elevate_online_exams/domain/repos/auth_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoadSavedUserCredentialsUseCase {
  final AuthRepo _authRepo;
  LoadSavedUserCredentialsUseCase(this._authRepo);

  Future<SavedUserCredentialsModel> call (){
    return _authRepo.loadSavedUserCredentials();
  }
}
