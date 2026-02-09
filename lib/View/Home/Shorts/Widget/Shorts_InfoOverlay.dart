import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Utils/app_colors.dart';
import '../../../../Widgets/Custom_Text.dart';

class ShortsInfoOverlay extends StatelessWidget {
  final String title;
  final String description;

  const ShortsInfoOverlay({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomText(
          text: title,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.white100,
        ),
        SizedBox(height: 8.h),
        SizedBox(
          width: 250.w,
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: description,
                  style: TextStyle(
                    color: AppColors.white100,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: " More",
                  style: TextStyle(
                    color: const Color(0xFFFFC727),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
