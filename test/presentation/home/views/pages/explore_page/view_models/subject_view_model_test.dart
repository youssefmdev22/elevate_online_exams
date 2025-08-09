import 'package:bloc_test/bloc_test.dart';
import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/subject_model.dart';
import 'package:elevate_online_exams/presentation/home/views/pages/explore_page/view_models/subject_states.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elevate_online_exams/presentation/home/views/pages/explore_page/view_models/subject_view_model.dart';
import 'package:mockito/annotations.dart';
import 'package:elevate_online_exams/domain/usecase/subject_use_case.dart';
import 'package:mockito/mockito.dart';

import 'subject_view_model_test.mocks.dart';

@GenerateMocks([SubjectUseCase])
void main() {
  group('subject view model test', () {
    late MockSubjectUseCase mockedSubjectUseCase;
    setUp(() {
      mockedSubjectUseCase = MockSubjectUseCase();
    });

    // SubjectViewModel subjectViewModel = SubjectViewModel(mockedSubjectUseCase);
    var expectedSubjects = [
      SubjectModel(id: "fake-id-1", name: "fake-name-1", icon: "fake-icon-1"),
      SubjectModel(id: "fake-id-2", name: "fake-name-2", icon: "fake-icon-2"),
    ];
    var expectedResult = ApiSuccessResult(expectedSubjects);
    provideDummy<ApiResult<List<SubjectModel>>>(expectedResult);

    blocTest<SubjectViewModel, SubjectState>(
      'emits [SubjectStateLoading , SubjectStateSuccess] when getAllSubjects Successed',
      build: () {
        when(
          mockedSubjectUseCase.call(),
        ).thenAnswer((_) async => expectedResult);
        return SubjectViewModel(mockedSubjectUseCase);
      },
      act: (subjectViewModel) => subjectViewModel.getAllSubjects(),
      expect:
          () => <SubjectState>[
            (SubjectStateLoading()),
            SubjectStateSuccess(subjects: expectedSubjects),
          ],
      verify: (subjectViewModel) {
        verify(mockedSubjectUseCase.call()).called(1);
      },
    );

    blocTest<SubjectViewModel, SubjectState>(
      'emits [SubjectStateLoading , SubjectStateFailure] when getAllSubjects failed',
      build: () {
        when(
          mockedSubjectUseCase.call(),
        ).thenAnswer((_) async => ApiErrorResult("Sever Error"));
        return SubjectViewModel(mockedSubjectUseCase);
      },
      act: (subjectViewModel) => subjectViewModel.getAllSubjects(),
      expect:
          () => <SubjectState>[
            SubjectStateLoading(),
            SubjectStateFailure(errorMessage: "Sever Error"),
          ],
      verify: (subjectViewModel) {
        verify(mockedSubjectUseCase.call()).called(1);
      },
    );

    blocTest<SubjectViewModel, SubjectState>(
      'emits [SubjectStateSuccess] with empty test when filterSubjects is called with no subjects match keyword.',
      build: () {
        final subjectViewModel = SubjectViewModel(mockedSubjectUseCase);
        subjectViewModel.allSubjects = expectedSubjects;
        return subjectViewModel;
      },
      act: (subjectViewModel) => subjectViewModel.filterSubjects(""),
      expect: () => <SubjectState>[SubjectStateSuccess(subjects: expectedSubjects)],
    );

    blocTest<SubjectViewModel, SubjectState>(
      'emits [SubjectStateSuccess] when filterSubjects is called with subjects match keyword.',
      build: () {
        final subjectViewModel = SubjectViewModel(mockedSubjectUseCase);
        subjectViewModel.allSubjects = expectedSubjects;
        return subjectViewModel;
      },
      act: (subjectViewModel) => subjectViewModel.filterSubjects("2"),
      expect:
          () => <SubjectState>[SubjectStateSuccess(subjects: [expectedSubjects[1]])],
    );
  });
}
