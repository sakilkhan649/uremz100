import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uremz100/Utils/app_colors.dart';
import 'package:uremz100/Utils/app_icons.dart';
import 'package:uremz100/Widgets/Custom_Text.dart';

class RewardStepWidget extends StatelessWidget {
  final String coins;
  final String time;
  final bool isCompleted;

  const RewardStepWidget({
    super.key,
    required this.coins,
    required this.time,
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 50.w,
          height: 60.h,
          decoration: BoxDecoration(
            color: Color(0xFF2C2C2E),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 24.w,
                height: 24.w,
                decoration: BoxDecoration(
                  color: AppColors.yellow100,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 1.w,
                  ),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppIcons.rewards__rank_icon,
                    height: 14.w,
                    width: 14.w,
                  ),
                ),
              ),
              SizedBox(height: 5.h),
              CustomText(
                text: coins,
                fontSize: 12.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ],
          ),
        ),
        SizedBox(height: 8.h),
        CustomText(text: time, fontSize: 10.sp, color: AppColors.gray200),
      ],
    );
  }
}
