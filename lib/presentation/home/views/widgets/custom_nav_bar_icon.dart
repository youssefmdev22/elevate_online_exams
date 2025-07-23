import 'package:elevate_online_exams/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomNavBarIcon extends StatelessWidget {
  final String imagePath;
  final bool isSelected;
  const CustomNavBarIcon({super.key, required this.imagePath, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6.w, horizontal: 20.h),
      decoration: BoxDecoration(
        color: isSelected ? AppColors.blue[10] : Colors.transparent,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: ImageIcon(AssetImage(imagePath),color: AppColors.blue),
    );
  }
}