import 'package:equatable/equatable.dart';

class VerifyResetCodeRequestModel extends Equatable  {
  final String? resetCode;

  const VerifyResetCodeRequestModel({this.resetCode});
  
  @override
  List<Object?> get props => [resetCode];
}
