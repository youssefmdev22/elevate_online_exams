import 'package:elevate_online_exams/core/resources/app_assets.dart';
import 'package:elevate_online_exams/core/resources/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileImageWidget extends StatelessWidget {
  const ProfileImageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 81.w,
            height: 81.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(180.r),
              image: DecorationImage(
                image: AssetImage(ImageAssets.profileImage),
              ),
            ),
          ),
          Positioned(
            bottom: 4.h,
            right: 4.w,
            child: Container(
              width: 24.w,
              height: 24.w,
              decoration: BoxDecoration(
                color: AppColors.blue[40],
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Center(
                child: Image.asset(
                  ImageAssets.icCamera,
                  width: 16.w,
                  height: 16.w,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
