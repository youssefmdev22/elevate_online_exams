import 'package:elevate_online_exams/domain/model/result_model.dart';
import 'package:hive/hive.dart';

import '../model/exam_model.dart';
import '../model/questions_model.dart';

class ResultAdapter extends TypeAdapter<ResultModel> {
  @override
  ResultModel read(BinaryReader reader) {
    final examValue = reader.read();
    final examModel = examValue is ExamModel ? examValue : null;

    final questionsLength = reader.readInt();
    final questionsList = List.generate(
      questionsLength,
      (_) => reader.read() as QuestionsModel,
    );

    return ResultModel(
      examModel: examModel,
      questionsList: questionsList,
      correctAnswers: reader.readInt(),
      examTime: reader.readInt(),
    );
  }

  @override
  int get typeId => 4;

  @override
  void write(BinaryWriter writer, ResultModel obj) {
    writer.write(obj.examModel);

    final questions = obj.questionsList ?? [];
    writer.writeInt(questions.length);
    for (var q in questions) {
      writer.write(q);
    }

    writer.writeInt(obj.correctAnswers ?? 0);

    writer.writeInt(obj.examTime ?? 0);
  }
}
