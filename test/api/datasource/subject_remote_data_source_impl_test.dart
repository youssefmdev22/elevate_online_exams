import 'package:elevate_online_exams/api/model/response/subject_response/metadata.dart';
import 'package:elevate_online_exams/api/model/response/subject_response/subject_response.dart';
import 'package:elevate_online_exams/api/model/subject_dto.dart';
import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/subject_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_online_exams/api/datasource/subject_remote_data_source_impl.dart';
import 'package:mockito/annotations.dart';
import 'package:elevate_online_exams/api/web_services/web_services.dart';
import 'package:mockito/mockito.dart';

import 'subject_remote_data_source_impl_test.mocks.dart';

@GenerateMocks([WebServices])
void main() {
  test(
    'when call getAllSubjects it should return all subject from api',
    () async {
      //Arrange
      MockWebServices mockedWebServices = MockWebServices();
      SubjectRemoteDataSourceImpl subjectRemoteDataSourceImpl =
          SubjectRemoteDataSourceImpl(mockedWebServices);
      
      var expectedResult = SubjectResponse(
        message: "fake-message",
        metadata: Metadata(),
        subjects: [
          SubjectDto(
            id: "fake-id-1",
            name: "fake-name-1",
            icon: "fake-icon-1",
            createdAt: DateTime(2024)
          ),
          SubjectDto(
            id: "fake-id-2",
            name: "fake-name-2",
            icon: "fake-icon-2",
            createdAt: DateTime(2024)
          )
        ],
      );
    
      when(
        mockedWebServices.getAllSubjects(),
      ).thenAnswer((_) async => expectedResult);
      //Act
      var result = await subjectRemoteDataSourceImpl.getAllSubjects();
      //Assert
      verify(mockedWebServices.getAllSubjects()).called(1);
      expect(result, isA<ApiSuccessResult<List<SubjectModel>>>());
      result as ApiSuccessResult<List<SubjectModel>>;
      expect(result.data.length, equals(expectedResult.subjects?.length));
    },
  );
}
