import 'package:elevate_online_exams/presentation/auth/edit_profile/views/screen/edit_profile_screen.dart';
import 'package:elevate_online_exams/presentation/home/view_models/home_view_model/home_view_model.dart';
import 'package:elevate_online_exams/presentation/home/views/pages/explore_page/views/screen/explore_page.dart';
import 'package:flutter/material.dart';

class CustomPageView extends StatelessWidget {
  final HomeViewModel homeViewModel;
  const CustomPageView({super.key, required this.homeViewModel});

  @override
  Widget build(BuildContext context) {
    return PageView(
      // physics: const NeverScrollableScrollPhysics(),
      onPageChanged: homeViewModel.onPageChanged,
      scrollDirection: Axis.horizontal,
      controller: homeViewModel.pageController,
      children: [ExplorePage(), SizedBox(), EditProfileScreen()],
    );
  }
}
