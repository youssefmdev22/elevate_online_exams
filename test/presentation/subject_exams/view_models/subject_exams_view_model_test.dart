import 'package:bloc_test/bloc_test.dart';
import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/subject_exams_model.dart';
import 'package:elevate_online_exams/presentation/subject_exams/view_models/subject_exams_states.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_online_exams/presentation/subject_exams/view_models/subject_exams_view_model.dart';
import 'package:mockito/annotations.dart';
import 'package:elevate_online_exams/domain/usecase/subject_exams_use_case.dart';
import 'package:mockito/mockito.dart';

import 'subject_exams_view_model_test.mocks.dart';

@GenerateMocks([SubjectExamsUseCase])
void main() {
  group('subject_exams_view_model_test', () {
    late MockSubjectExamsUseCase mockedSubjectExamsUseCase;
    var subjectId = "1234";
    var expectedExams = [
      SubjectExamsModel(
        id: "fake-id-1",
        title: "fake-title-1",
        duration: 5,
        subject: "fake-subject-1",
        numberOfQuestions: 20,
        active: true,
      ),
      SubjectExamsModel(
        id: "fake-id-2",
        title: "fake-title-2",
        duration: 5,
        subject: "fake-subject-2",
        numberOfQuestions: 20,
        active: true,
      ),
    ];
    var expectedResult = ApiSuccessResult(expectedExams);
    provideDummy<ApiResult<List<SubjectExamsModel>>>(expectedResult);
    setUp(() {
      mockedSubjectExamsUseCase = MockSubjectExamsUseCase();
    });

    blocTest<SubjectExamsViewModel, SubjectExamsState>(
      'emits [SubjectExamsStateLoading , SubjectExamsStateSuccess] when getAllSubjectExams is successed.',
      build: () {
        when(
          mockedSubjectExamsUseCase.call(subjectId),
        ).thenAnswer((_) async => expectedResult);
        return SubjectExamsViewModel(mockedSubjectExamsUseCase);
      },
      act: (viewModel) => viewModel.getAllSubjectExams(subjectId),
      expect:
          () => <SubjectExamsState>[
            SubjectExamsStateLoading(),
            SubjectExamsStateSuccess(subjectExams: expectedExams),
          ],
      verify: (viewModel) {
        verify(mockedSubjectExamsUseCase.call(subjectId)).called(1);
      },
    );

    blocTest<SubjectExamsViewModel, SubjectExamsState>(
      'emits [SubjectExamsStateLoading , SubjectExamsStateFailure] when getAllSubjectExams is failed.',
      build: () {
        when(
          mockedSubjectExamsUseCase.call(subjectId),
        ).thenAnswer((_) async => ApiErrorResult("Server Error"));
        return SubjectExamsViewModel(mockedSubjectExamsUseCase);
      },
      act: (viewModel) => viewModel.getAllSubjectExams(subjectId),
      expect:
          () => <SubjectExamsState>[
            SubjectExamsStateLoading(),
            SubjectExamsStateFailure(errorMessage: "Server Error"),
          ],
      verify: (viewModel) {
        verify(mockedSubjectExamsUseCase.call(subjectId)).called(1);
      },
    );
  });
}
