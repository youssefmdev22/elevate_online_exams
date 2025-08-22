import 'package:elevate_online_exams/presentation/home/view_models/home_view_model/home_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class HomeViewModel extends Cubit<HomeState> {
  HomeViewModel() : super(HomeStateInitial());

  int selectedIndex = 0;
  final PageController pageController = PageController();

  void bottomNavBarOnTap(int index) {
    selectedIndex = index;
    pageController.jumpToPage(index);
    emit(HomeStateChngeSelectedIndex());
  }

  void onPageChanged(int index) {
    selectedIndex = index;
    emit(HomeStateChngeSelectedIndex());
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
