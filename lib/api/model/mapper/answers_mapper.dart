import 'package:elevate_online_exams/api/model/answers_dto.dart';
import 'package:elevate_online_exams/domain/model/answers_model.dart';

class AnswersMapper{
  static AnswersModel fromDto(AnswersDTO dto){
    return AnswersModel(
      answer: dto.answer,
      key: dto.key,
    );
  }
}