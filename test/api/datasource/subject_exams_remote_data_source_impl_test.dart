import 'package:elevate_online_exams/api/model/response/subject_exams_response/subject_exams_response.dart';
import 'package:elevate_online_exams/api/model/subject_exams_dto.dart';
import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/subject_exams_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_online_exams/api/datasource/subject_exams_remote_data_source_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:elevate_online_exams/api/web_services/web_services.dart';
import 'package:mockito/mockito.dart';

import 'subject_exams_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([WebServices])
void main() {
  test(
    'when call getAllSubjectExams it should return all subject exams from api with correct parameters',
    () async {
      //Arrange
      MockWebServices mockedWebServices = MockWebServices();
      // set up the fake data
      SubjectExamsRemoteDataSourceImpl subjectExamsRemoteDataSourceImpl =
          SubjectExamsRemoteDataSourceImpl(mockedWebServices);
      var subjectId = "fake";
      var expectedResult = SubjectExamsResponse(
        exams: [
          SubjectExamsDto(
            id: "fake-id-1",
            title: "fake-title-1",
            duration: 5,
            subject: "fake-subject-1",
            numberOfQuestions: 20,
            active: true,
            createdAt: DateTime(2024),
          ),
          SubjectExamsDto(
            id: "fake-id-1",
            title: "fake-title-1",
            duration: 5,
            subject: "fake-subject-1",
            numberOfQuestions: 20,
            active: true,
            createdAt: DateTime(2024),
          ),
        ],
      );
      when(
        mockedWebServices.getAllSubjectExams(subjectId),
      ).thenAnswer((_) async => expectedResult);
      // act
      var result = await subjectExamsRemoteDataSourceImpl.getAllSubjectExams(
        subjectId,
      );
      // assert
      verify(mockedWebServices.getAllSubjectExams(subjectId)).called(1);
      expect(result, isA<ApiSuccessResult<List<SubjectExamsModel>>>());
      result as ApiSuccessResult<List<SubjectExamsModel>>;
      expect(result.data.length, expectedResult.exams?.length);
    },
  );
}
