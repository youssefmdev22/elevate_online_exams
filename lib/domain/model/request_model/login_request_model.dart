import 'package:equatable/equatable.dart';

class LoginRequestModel extends Equatable{
  final String? email;
  final String? password;

  const LoginRequestModel({this.email, this.password});
  
  @override
  List<Object?> get props => [email,password];
}
