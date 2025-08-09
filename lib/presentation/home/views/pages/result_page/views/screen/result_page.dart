import 'package:elevate_online_exams/presentation/home/views/pages/result_page/view_model/result_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../../core/di/di.dart';
import '../../../../../../../generated/l10n.dart';
import '../widget/result_item.dart';
import 'package:collection/collection.dart';

class ResultPage extends StatefulWidget {
  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  late final ResultViewModel _resultViewModel;

  @override
  void initState() {
    super.initState();
    _resultViewModel = getIt.get<ResultViewModel>();
    _resultViewModel.getAllResult();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(AppLocalizations.of(context).results),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: BlocBuilder<ResultViewModel, ResultState>(
          bloc: _resultViewModel,
          builder: (context, state) {
            switch (state) {
              case ResultInitial():
                return const Center(child: CircularProgressIndicator());
              case ResultLoading():
                return const Center(child: CircularProgressIndicator());
              case ResultSuccess():
                if (state.resultList.isEmpty) {
                  return Center(
                    child: Text(
                      AppLocalizations.of(context).noResultsFound,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  );
                } else {
                  final groupedResults = groupBy(
                    state.resultList,
                        (item) => item.examModel?.title,
                  ).entries.toList();
                  return ListView.builder(
                    itemCount: groupedResults.length,
                    itemBuilder: (_, index) {
                      final title = groupedResults[index].key;
                      final results = groupedResults[index].value;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title!,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(height: 24.h),
                          ...results.map((result) => ResultItem(resultData: result)),
                        ],
                      );
                    },
                  );
                }
              case ResultError():
                return Center(
                  child: Text(
                    state.errorMessage,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                );
            }
          },
        ),
      ),
    );
  }
}
