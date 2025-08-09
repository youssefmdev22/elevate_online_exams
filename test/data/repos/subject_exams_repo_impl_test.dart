import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/subject_exams_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_online_exams/data/repos/subject_exams_repo_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:elevate_online_exams/data/datasource/subject_exams_remote_data_source.dart';
import 'package:mockito/mockito.dart';

import 'subject_exams_repo_impl_test.mocks.dart';

@GenerateMocks([SubjectExamsRemoteDataSource])
void main() {
  test(
    'when call getAllSubjectExams it should return all subject exams with correct parameter',
    () async {
      //Arrange
      MockSubjectExamsRemoteDataSource mockedSubjectExamsRemoteDataSource =
          MockSubjectExamsRemoteDataSource();
      SubjectExamsRepoImpl subjectExamsRepoImpl = SubjectExamsRepoImpl(
        mockedSubjectExamsRemoteDataSource,
      );
      var subjectId = "1234";
      var expectedSubjectExams = [
        SubjectExamsModel(
          id: "fake-id-1",
          title: "fake-title-1",
          duration: 5,
          subject: "fake-subject",
          numberOfQuestions: 20,
          active: true,
        ),
        SubjectExamsModel(
          id: "fake-id-1",
          title: "fake-title-1",
          duration: 5,
          subject: "fake-subject",
          numberOfQuestions: 20,
          active: true,
        ),
      ];
      var expectedResult = ApiSuccessResult(expectedSubjectExams);
      provideDummy<ApiResult<List<SubjectExamsModel>>>(expectedResult);
      when(
        mockedSubjectExamsRemoteDataSource.getAllSubjectExams(subjectId),
      ).thenAnswer((_) async => expectedResult);
      //Act
      var result = await subjectExamsRepoImpl.getAllSubjectExams(subjectId);
      //Assert
      verify(
        mockedSubjectExamsRemoteDataSource.getAllSubjectExams(subjectId),
      ).called(1);
      expect(result, isA<ApiSuccessResult<List<SubjectExamsModel>>>());
      result as ApiSuccessResult<List<SubjectExamsModel>>;
      expect(result.data, expectedSubjectExams);
    },
  );
}
