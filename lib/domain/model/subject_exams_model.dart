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
}
