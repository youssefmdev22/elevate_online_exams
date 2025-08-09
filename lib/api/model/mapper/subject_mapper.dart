import 'package:elevate_online_exams/api/model/subject_dto.dart';
import 'package:elevate_online_exams/domain/model/subject_model.dart';

class SubjectMapper {
  static SubjectModel fromDto(SubjectDto dto) {
    return SubjectModel(id: dto.id, name: dto.name, icon: dto.icon);
  }
}
