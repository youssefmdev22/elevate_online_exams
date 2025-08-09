import 'package:hive/hive.dart';

import '../model/answers_model.dart';
import '../model/exam_model.dart';
import '../model/questions_model.dart';

class QuestionsAdapter extends TypeAdapter<QuestionsModel> {
  @override
  QuestionsModel read(BinaryReader reader) {
    final answersLength = reader.readInt();
    final answers = List.generate(
      answersLength,
          (_) => reader.read() as AnswersModel,
    );

    final subjectValue = reader.read();
    final examValue = reader.read();

    return QuestionsModel(
      answers: answers,
      type: reader.readString(),
      id: reader.readString(),
      question: reader.readString(),
      correct: reader.readString(),
      subject: subjectValue,
      exam: examValue is ExamModel ? examValue : null,
      createdAt: reader.readString(),
      selectedAnswer: reader.readInt(),
    );
  }

  @override
  void write(BinaryWriter writer, QuestionsModel obj) {
    final answers = obj.answers ?? [];
    writer.writeInt(answers.length);
    for (var a in answers) {
      writer.write(a);
    }

    writer.writeString(obj.type ?? '');
    writer.writeString(obj.id ?? '');
    writer.writeString(obj.question ?? '');
    writer.writeString(obj.correct ?? '');
    writer.write(obj.subject);
    writer.write(obj.exam);
    writer.writeString(obj.createdAt ?? '');
    writer.writeInt(obj.selectedAnswer ?? -1);
  }

  @override
  int get typeId => 3;
}
