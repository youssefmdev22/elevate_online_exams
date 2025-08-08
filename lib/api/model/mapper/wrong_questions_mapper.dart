import 'package:elevate_online_exams/api/model/wrong_questions_dto.dart';
import 'package:elevate_online_exams/domain/model/wrong_questions_model.dart';

import 'answers_mapper.dart';

class WrongQuestionsMapper{
  static WrongQuestionsModel fromDto(WrongQuestionsDTO dto){
    return WrongQuestionsModel(
      QID: dto.QID,
      question: dto.Question,
      inCorrectAnswer: dto.inCorrectAnswer,
      correctAnswer: dto.correctAnswer,
      //answers: dto.answers?.map((answer) => AnswersMapper.fromDto(answer)).toList(),
    );
  }
}