import 'package:equatable/equatable.dart';

class SavedUserCredentialsModel extends Equatable {
  final bool isRemembered;
  final String? email;
  final String? password;

  const SavedUserCredentialsModel({
    this.isRemembered = false,
    this.email,
    this.password,
  });
  
  @override
  List<Object?> get props => [isRemembered , email , password];
}
