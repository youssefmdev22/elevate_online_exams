import 'package:hive/hive.dart';
import '../model/exam_model.dart';

class ExamAdapter extends TypeAdapter<ExamModel> {

  @override
  ExamModel read(BinaryReader reader) {
    return ExamModel(
      id: reader.readString(),
      title: reader.readString(),
      duration: reader.readInt(),
      subject: reader.readString(),
      numberOfQuestions: reader.readInt(),
      active: reader.readBool(),
      createdAt: reader.readString(),
    );
  }

  @override
  int get typeId => 2;

  @override
  void write(BinaryWriter writer, ExamModel obj) {
    writer.writeString(obj.id ?? '');
    writer.writeString(obj.title ?? '');
    writer.writeInt(obj.duration ?? 0);
    writer.writeString(obj.subject ?? '');
    writer.writeInt(obj.numberOfQuestions ?? 0);
    writer.writeBool(obj.active ?? false);
    writer.writeString(obj.createdAt ?? '');
  }
}
