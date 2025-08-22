import 'package:hive/hive.dart';
import '../model/answers_model.dart';

class AnswersAdapter extends TypeAdapter<AnswersModel> {
  @override
  AnswersModel read(BinaryReader reader) {
    return AnswersModel(
      answer: reader.readString(),
      key: reader.readString(),
    );
  }

  @override
  int get typeId => 1;

  @override
  void write(BinaryWriter writer, AnswersModel obj) {
    writer.writeString(obj.answer ?? '');
    writer.writeString(obj.key ?? '');
  }
}
