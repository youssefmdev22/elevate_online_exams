import 'package:elevate_online_exams/domain/model/subject_model.dart';
import 'package:elevate_online_exams/presentation/home/views/pages/explore_page/views/widgets/subject_list_view_item.dart';
import 'package:flutter/material.dart';

class SubjectListView extends StatelessWidget {
  final List<SubjectModel> subjects;
  const SubjectListView({super.key, required this.subjects});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return SubjectListViewItem(subject: subjects[index]);
      },
      itemCount: subjects.length,
    );
  }
}
