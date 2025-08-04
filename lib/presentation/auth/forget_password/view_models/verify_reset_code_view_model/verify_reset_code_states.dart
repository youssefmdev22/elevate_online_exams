import 'package:elevate_online_exams/domain/model/verify_reset_code_model.dart';

sealed class VerifyResetCodeState {}

class VerifyResetCodeStateInital extends VerifyResetCodeState {}

class VerifyResetCodeStateLoading extends VerifyResetCodeState {}

class VerifyResetCodeStateSuccess extends VerifyResetCodeState {
  final VerifyResetCodeModel verifyResetCodeModel;
  VerifyResetCodeStateSuccess({required this.verifyResetCodeModel});
}

class VerifyResetCodeStateFailure extends VerifyResetCodeState {
  final String errorMessage;
  VerifyResetCodeStateFailure({required this.errorMessage});
}

class VerifyResetCodeStateResnsendSuccess extends VerifyResetCodeState {}
