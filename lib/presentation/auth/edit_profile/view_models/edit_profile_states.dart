import 'package:elevate_online_exams/domain/model/user_model.dart';

sealed class EditProfileState {}

class EditProfileStateInital extends EditProfileState {}

class EditProfileStateLoading extends EditProfileState {}

class EditProfileStateSuccessStatus extends EditProfileState {}

class EditProfileStateSuccess extends EditProfileState {
  final UserModel userModel;
  EditProfileStateSuccess({required this.userModel});
}

class EditProfileStateFailure extends EditProfileState {
  final String errorMessage;
  EditProfileStateFailure({required this.errorMessage});
}


