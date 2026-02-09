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
      padding: EdgeInsets.symmetric(vertical: 10.h),
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
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Color(0xFFEDADA1),
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
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
                        height: 20.w,
                        width: 20.w,
                      ),
                      SizedBox(width: 4.w),
                      CustomText(
                        text: coinsLabel ?? "",
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.yellow100,
                      ),
                    ],
                  ),
                  CustomText(
                    text: title,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFEDADA1),
                  ),
                ],
              ],
            ),
          ),
          ElevatedButton(
            onPressed: onTap,
            style: ElevatedButton.styleFrom(
              backgroundColor: isHighlight
                  ? AppColors.yellow200
                  : AppColors.orange100,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.symmetric(vertical: 8.h),
              elevation: 0,
            ),
            child: CustomText(
              text: buttonText,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
