import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/request_model/reset_password_request_model.dart';
import 'package:elevate_online_exams/domain/model/reset_password_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_online_exams/domain/usecase/reset_password_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:elevate_online_exams/domain/repos/auth_repo.dart';
import 'package:mockito/mockito.dart';

import 'reset_password_use_case_test.mocks.dart';

@GenerateMocks([AuthRepo])
void main() {
  test(
    'when call resetPassword it will return resetPassword from repo with correct parameters',
    () async {
      //Arrange
      MockAuthRepo mockedAuthRepo = MockAuthRepo();
      ResetPasswordUseCase resetPasswordUseCase = ResetPasswordUseCase(
        mockedAuthRepo,
      );
      var email = "fake-email";
      var newPassword = "fake-newPasword";
      var expectedModel = ResetPasswordModel(
        message: "Fake-message",
        token: "fake-token",
        code: "10",
      );
      var expectedResult = ApiSuccessResult(expectedModel);
      provideDummy<ApiResult<ResetPasswordModel>>(expectedResult);
      when(
        mockedAuthRepo.resetPassword(
          ResetPasswordRequestModel(email: email, newPassword: newPassword),
        ),
      ).thenAnswer((_) async => expectedResult);
      //Act
      var result = await resetPasswordUseCase.call(
        ResetPasswordRequestModel(email: email, newPassword: newPassword),
      );
      //Assert
      verify(
        mockedAuthRepo.resetPassword(
          ResetPasswordRequestModel(email: email, newPassword: newPassword),
        ),
      );
      expect(result, isA<ApiSuccessResult<ResetPasswordModel>>());
      result as ApiSuccessResult<ResetPasswordModel>;
      expect(result.data, expectedModel);
    },
  );
}
