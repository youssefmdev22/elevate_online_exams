import 'package:elevate_online_exams/domain/model/correct_questions_model.dart';

import '../correct_questions_dto.dart';
import 'answers_mapper.dart';

class CorrectQuestionsMapper{
  static CorrectQuestionsModel fromDto(CorrectQuestionsDTO dto){
    return CorrectQuestionsModel(
      QID: dto.QID,
      question: dto.Question,
      correctAnswer: dto.correctAnswer,
      //answers: dto.answers?.map((answer) => AnswersMapper.fromDto(answer)).toList(),
    );
  }
}