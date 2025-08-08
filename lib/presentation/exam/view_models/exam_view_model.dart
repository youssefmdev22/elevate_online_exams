import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:elevate_online_exams/api/model/request/questions/answers_request_model.dart';
import 'package:elevate_online_exams/core/api_result/api_result.dart';
import 'package:elevate_online_exams/domain/model/check_questions_model.dart';
import 'package:elevate_online_exams/domain/model/questions_model.dart';
import 'package:elevate_online_exams/domain/usecase/get_all_exam_questions_use_case.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../api/model/request/questions/questions_request_model.dart';
import '../../../domain/usecase/check_exam_questions_use_case.dart';

part 'exam_state.dart';

@injectable
class ExamViewModel extends Cubit<ExamState> {
  final GetAllExamQuestionsUseCase _getAllExamQuestionsUseCase;
  final CheckExamQuestionsUseCase _checkExamQuestionsUseCase;

  ExamViewModel(
    this._getAllExamQuestionsUseCase,
    this._checkExamQuestionsUseCase,
  ) : super(ExamInitial());

  List<QuestionsModel> questionsList = [];

  late final String examId;
  late final int examDuration;
  Timer? _timer;
  late int totalQuestions;
  late int remainingSeconds = examDuration * 60;
  ValueNotifier<String> timerValue = ValueNotifier("00:00");
  ValueNotifier<int> questionIndex = ValueNotifier(0);
  ValueNotifier<int?> answerIndex = ValueNotifier(-1);

  Future<void> getAllExamQuestions() async {
    emit(ExamLoading());
    final response = await _getAllExamQuestionsUseCase(examId);
    switch (response) {
      case ApiSuccessResult<List<QuestionsModel>>():
        questionsList = response.data;
        totalQuestions = questionsList.length;
        _startTimer();
        emit(ExamSuccess(questionsList));
      case ApiErrorResult<List<QuestionsModel>>():
        emit(ExamError(response.errorMessage));
    }
  }

  Future<void> checkExamQuestions() async {
    emit(ExamLoading());
    final response = await _checkExamQuestionsUseCase(
      QuestionsRequestModel(
        answers:
            questionsList
                .map(
                  (question) => AnswersRequestModel(
                    questionId: question.id,
                    correct:
                        "A${question.selectedAnswer != null ? question.selectedAnswer! + 1 : 0}",
                  ),
                )
                .toList(),
        time: examDuration,
      ),
    );
    switch (response) {
      case ApiSuccessResult<CheckQuestionsModel>():
        emit(ExamCheckQuestions(response.data));
      case ApiErrorResult<CheckQuestionsModel>():
        emit(ExamError(response.errorMessage));
    }
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        remainingSeconds--;
        timerValue.value = _formatTime(remainingSeconds);
      } else {
        timer.cancel();
        emit(ExamTimeout());
      }
    });
  }

  String _formatTime(int totalSeconds) {
    final minutes = (totalSeconds ~/ 60).toString().padLeft(2, '0');
    final seconds = (totalSeconds % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  bool isDangerTime() {
    return (examDuration * 60) / 2 <= remainingSeconds;
  }

  void nextQuestion() {
    if (questionIndex.value < totalQuestions - 1) {
      questionIndex.value++;
      _updateSelectedAnswer();
    } else {
      finishExam();
    }
  }

  void previousQuestion() {
    if (questionIndex.value > 0) {
      questionIndex.value--;
      _updateSelectedAnswer();
    }
  }

  void _updateSelectedAnswer() {
    answerIndex.value = questionsList[questionIndex.value].selectedAnswer;
  }

  void changeSelectedAnswer(int? value) {
    questionsList[questionIndex.value].selectedAnswer = value;
    _updateSelectedAnswer();
  }

  void finishExam() {
    _timer!.cancel();
    checkExamQuestions();
  }

  void restartExam() {
    _timer = null;
    remainingSeconds = examDuration * 60;
    questionIndex.value = 0;
    answerIndex.value = -1;
    getAllExamQuestions();
  }
}
