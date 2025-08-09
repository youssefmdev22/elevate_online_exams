import 'package:equatable/equatable.dart';

class SubjectExamsModel extends Equatable {
  final String? id;
  final String? title;
  final int? duration;
  final String? subject;
  final int? numberOfQuestions;
  final bool? active;

  const SubjectExamsModel({
    this.id,
    this.title = "Exam Title",
    this.duration,
    this.subject,
    this.numberOfQuestions,
    this.active,
  });
  
  @override
  List<Object?> get props => [id,title,subject];
}
