import 'package:elevate_online_exams/api/model/mapper/correct_questions_mapper.dart';
import 'package:elevate_online_exams/api/model/mapper/wrong_questions_mapper.dart';
import 'package:elevate_online_exams/api/model/response/questions/check_questions_response.dart';
import 'package:elevate_online_exams/domain/model/check_questions_model.dart';

class CheckQuestionsMapper {
  static CheckQuestionsModel fromResponse({
    required CheckQuestionsResponse checkQuestionsResponse,
  }) {
    return CheckQuestionsModel(
      message: checkQuestionsResponse.message,
      correct: checkQuestionsResponse.correct,
      wrong: checkQuestionsResponse.wrong,
      total: checkQuestionsResponse.total,
      wrongQuestions:
          checkQuestionsResponse.wrongQuestions
              ?.map((question) => WrongQuestionsMapper.fromDto(question))
              .toList(),
      correctQuestions:
          checkQuestionsResponse.correctQuestions
              ?.map((question) => CorrectQuestionsMapper.fromDto(question))
              .toList(),
    );
  }
}
