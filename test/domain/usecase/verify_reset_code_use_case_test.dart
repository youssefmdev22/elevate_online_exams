import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/request_model/verify_reset_code_request_model.dart';
import 'package:elevate_online_exams/domain/model/verify_reset_code_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_online_exams/domain/usecase/verify_reset_code_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:elevate_online_exams/domain/repos/auth_repo.dart';
import 'package:mockito/mockito.dart';

import 'verify_reset_code_use_case_test.mocks.dart';

@GenerateMocks([AuthRepo])
void main() {
  test(
    'when call verifyResetCode it will return reset code from repo with correct parameters',
    () async {
      //Arrange
      MockAuthRepo mockedAuthRepo = MockAuthRepo();
      VerifyResetCodeUseCase verifyResetCodeUseCase = VerifyResetCodeUseCase(
        mockedAuthRepo,
      );
      var resetCode = "20";
      var expectedResetCode = VerifyResetCodeModel(
        status: "fake-status",
        message: "fake-message",
        code: 11,
      );
      var expectedResult = ApiSuccessResult(expectedResetCode);
      provideDummy<ApiResult<VerifyResetCodeModel>>(expectedResult);
      when(
        mockedAuthRepo.verifyResetCode(
          VerifyResetCodeRequestModel(resetCode: resetCode),
        ),
      ).thenAnswer((_) async => expectedResult);
      //Act
      var result = await verifyResetCodeUseCase.call(
        VerifyResetCodeRequestModel(resetCode: resetCode),
      );
      //Assert
      verify(
        mockedAuthRepo.verifyResetCode(
          VerifyResetCodeRequestModel(resetCode: resetCode),
        ),
      ).called(1);
      expect(result, isA<ApiSuccessResult<VerifyResetCodeModel>>());
      result as ApiSuccessResult<VerifyResetCodeModel>;
      expect(result.data, expectedResetCode);
    },
  );
}
