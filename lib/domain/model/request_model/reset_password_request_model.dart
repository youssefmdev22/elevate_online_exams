import 'package:equatable/equatable.dart';

class ResetPasswordRequestModel extends Equatable {
  final String? email;
  final String? newPassword;

  const ResetPasswordRequestModel({this.email, this.newPassword});
  
  @override
  List<Object?> get props => [email,newPassword];
}
