import 'package:bloc/bloc.dart';
import 'package:elevate_online_exams/domain/model/result_model.dart';
import 'package:elevate_online_exams/domain/usecase/get_all_result_use_case.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'result_state.dart';

@injectable
class ResultViewModel extends Cubit<ResultState> {
  final GetAllResultUseCase _getAllResultUseCase;
  ResultViewModel(this._getAllResultUseCase) : super(ResultInitial());

  Future<void> getAllResult() async {
    emit(ResultLoading());
    try {
      final result = await _getAllResultUseCase();
      emit(ResultSuccess(result));
    } catch (e) {
      emit(ResultError(e.toString()));
    }
  }
}
