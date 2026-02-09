import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uremz100/Utils/app_colors.dart';
import 'package:uremz100/Widgets/Custom_Text.dart';

import '../../../../Utils/app_icons.dart';

class TaskItemWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? coinsLabel;
  final String buttonText;
  final bool isHighlight;
  final String layoutType; // 'subtitle_coins' or 'top_coins'
  final VoidCallback onTap;

  const TaskItemWidget({
    super.key,
    required this.title,
    this.subtitle,
    this.coinsLabel,
    required this.buttonText,
    this.isHighlight = false,
    this.layoutType = 'top_coins',
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (layoutType == 'subtitle_coins') ...[
                  CustomText(
                    text: title,
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  SizedBox(height: 4.h),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 14.sp,
                      ),
                      children: [
                        TextSpan(text: subtitle ?? ""),
                        TextSpan(
                          text: " $coinsLabel ",
                          style: TextStyle(
                            color: AppColors.yellow100,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const TextSpan(text: "Coins"),
                      ],
                    ),
                  ),
                ] else if (layoutType == 'top_coins') ...[
                  Row(
                    children: [
                      SvgPicture.asset(
                        AppIcons.rewards__rank_icon,
                        height: 24.w,
                        width: 24.w,
                      ),
                      SizedBox(width: 8.w),
                      CustomText(
                        text: coinsLabel ?? "",
                        fontSize: 22.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.yellow100,
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  CustomText(
                    text: title,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.8),
                  ),
                ],
              ],
            ),
          ),
          SizedBox(
            width: 88.w,
            height: 38.h,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: isHighlight
                    ? AppColors.yellow200
                    : AppColors.orange100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.r),
                ),
                padding: EdgeInsets.zero,
                elevation: 0,
              ),
              child: CustomText(
                text: buttonText,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: isHighlight ? Colors.black : Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
