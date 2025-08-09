import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/subject_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_online_exams/domain/usecase/subject_use_case.dart';
import 'package:mockito/annotations.dart';
import 'package:elevate_online_exams/domain/repos/subject_repo.dart';
import 'package:mockito/mockito.dart';

import 'subject_use_case_test.mocks.dart';

@GenerateMocks([SubjectRepo])
void main() {
  test(
    'when call getAllSubjects it should return all SubjectModel from repo',
    () async {
      //arrange
      MockSubjectRepo mockedSubjectRepo = MockSubjectRepo();
      SubjectUseCase subjectUseCase = SubjectUseCase(mockedSubjectRepo);
      var expectedSubjects = [
        SubjectModel(id: "Fake-id-1", name: "fake-name-1", icon: "fake-icon-1"),
        SubjectModel(id: "Fake-id-2", name: "fake-name-2", icon: "fake-icon-2"),
      ];
      var expectedResult = ApiSuccessResult(expectedSubjects);
      provideDummy<ApiResult<List<SubjectModel>>>(expectedResult);
      when(
        mockedSubjectRepo.getAllSubjects(),
      ).thenAnswer((_) async => expectedResult);
      //act
      var result = await subjectUseCase.call();
      //assert
      verify(mockedSubjectRepo.getAllSubjects()).called(1);

      expect(result, isA<ApiSuccessResult<List<SubjectModel>>>());
      result as ApiSuccessResult<List<SubjectModel>>;
      expect(result.data, equals(expectedSubjects));
    },
  );
}
