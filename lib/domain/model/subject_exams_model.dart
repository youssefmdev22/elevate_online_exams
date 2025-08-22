import 'package:elevate_online_exams/domain/model/exam_model.dart';

class SubjectExamsModel {
  String? id;
  String? title;
  int? duration;
  String? subject;
  int? numberOfQuestions;
  bool? active;

  SubjectExamsModel({
    this.id,
    this.title = "Exam Title",
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
  });

  ExamModel toExamModel() {
    return ExamModel(
      id: id,
      title: title,
      duration: duration,
      subject: subject,
      numberOfQuestions: numberOfQuestions,
      active: active,
    );
  }
}
