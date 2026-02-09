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
  final VoidCallback onTap;

  const TaskItemWidget({
    super.key,
    required this.title,
    this.subtitle,
    this.coinsLabel,
    required this.buttonText,
    this.isHighlight = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (coinsLabel != null && !title.contains(coinsLabel!))
                      Padding(
                        padding: EdgeInsets.only(right: 8.w),
                        child: SvgPicture.asset(
                          AppIcons.rewards__rank_icon,
                          height: 24.w,
                          width: 24.w,
                        ),
                      ),

                    Flexible(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            if (coinsLabel != null && title.isEmpty) ...[
                              WidgetSpan(
                                child: SvgPicture.asset(
                                  AppIcons.rewards__rank_icon,
                                  height: 24.w,
                                  width: 24.w,
                                ),
                              ),
                              WidgetSpan(child: SizedBox(width: 4.w)),
                              TextSpan(
                                text: coinsLabel,
                                style: TextStyle(
                                  color: AppColors.yellow100,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ] else ...[
                              TextSpan(
                                text: title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                if (subtitle != null ||
                    (coinsLabel != null && title.isNotEmpty))
                  Padding(
                    padding: EdgeInsets.only(top: 4.h),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                          color: AppColors.gray200,
                          fontSize: 12.sp,
                        ),
                        children: [
                          TextSpan(text: subtitle ?? title),
                          if (coinsLabel != null && title.isNotEmpty) ...[
                            TextSpan(
                              text: " +$coinsLabel ",
                              style: TextStyle(
                                color: AppColors.yellow100,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(text: "Coins"),
                          ],
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(
            width: 80.w,
            height: 32.h,
            child: ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: isHighlight
                    ? AppColors.yellow200
                    : AppColors.orange100,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4.r),
                ),
                padding: EdgeInsets.zero,
              ),
              child: CustomText(
                text: buttonText,
                fontSize: 14.sp,
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
