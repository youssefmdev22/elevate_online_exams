import 'package:elevate_online_exams/domain/model/subject_exams_model.dart';
import 'package:elevate_online_exams/presentation/subject_exams/views/widgets/subject_exams_list_view_item.dart';
import 'package:flutter/material.dart';

class SubjectExamsListView extends StatelessWidget {
  final List<SubjectExamsModel> subjectExams;
  final String subjectName;
  const SubjectExamsListView({
    super.key,
    required this.subjectExams,
    required this.subjectName,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: subjectExams.length,
      itemBuilder: (context, index) {
        return SubjectExamsListViewItem(
          subjectExam: subjectExams[index],
          subjectName: subjectName,
        );
      },
    );
  }
}
