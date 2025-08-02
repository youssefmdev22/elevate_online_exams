import 'package:elevate_online_exams/api/model/subject_exams_dto.dart';
import 'package:elevate_online_exams/domain/model/subject_exams_model.dart';

class SubjectExamsMapper {
  static SubjectExamsModel fromDto(SubjectExamsDto dto) {
    return SubjectExamsModel(
      id: dto.id,
      title: dto.title,
      duration: dto.duration,
      subject: dto.subject,
      numberOfQuestions: dto.numberOfQuestions,
      active: dto.active,
    );
  }
}
