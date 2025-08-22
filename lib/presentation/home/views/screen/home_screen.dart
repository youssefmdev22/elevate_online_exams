import 'package:elevate_online_exams/core/di/di.dart';
import 'package:elevate_online_exams/core/resources/app_assets.dart';
import 'package:elevate_online_exams/core/resources/app_colors.dart';
import 'package:elevate_online_exams/core/resources/app_theme.dart';
import 'package:elevate_online_exams/generated/l10n.dart';
import 'package:elevate_online_exams/presentation/home/view_models/home_view_model/home_states.dart';
import 'package:elevate_online_exams/presentation/home/view_models/home_view_model/home_view_model.dart';
import 'package:elevate_online_exams/presentation/home/views/widgets/custom_nav_bar_icon.dart';
import 'package:elevate_online_exams/presentation/home/views/widgets/custom_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  final bool navigateToResult;
  HomeScreen({super.key, this.navigateToResult = false});

  final HomeViewModel homeViewModel = getIt.get<HomeViewModel>();

  @override
  Widget build(BuildContext context) {
    if (navigateToResult) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        homeViewModel.bottomNavBarOnTap(1);
      });
    }
    return BlocBuilder<HomeViewModel, HomeState>(
      bloc: homeViewModel,
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            onTap: homeViewModel.bottomNavBarOnTap,
            currentIndex: homeViewModel.selectedIndex,
            backgroundColor: AppColors.lightBlue,
            unselectedItemColor: AppColors.blue,
            selectedItemColor: AppColors.blue,
            selectedLabelStyle: AppTheme.getTextStyle(
              color: AppColors.blue,
              fontSize: 14.sp,
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: AppTheme.getTextStyle(
              color: AppColors.blue,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            items: [
              BottomNavigationBarItem(
                icon: CustomNavBarIcon(
                  imagePath: ImageAssets.exploreIcon,
                  isSelected: homeViewModel.selectedIndex == 0,
                ),
                label: AppLocalizations.of(context).explore,
              ),
              BottomNavigationBarItem(
                icon: CustomNavBarIcon(
                  imagePath: ImageAssets.resultIcon,
                  isSelected: homeViewModel.selectedIndex == 1,
                ),
                label: AppLocalizations.of(context).result,
              ),
              BottomNavigationBarItem(
                icon: CustomNavBarIcon(
                  imagePath: ImageAssets.profileIcon,
                  isSelected: homeViewModel.selectedIndex == 2,
                ),
                label: AppLocalizations.of(context).profile,
              ),
            ],
          ),
          body: SafeArea(child: CustomPageView(homeViewModel: homeViewModel)),
        );
      },
    );
  }
}
