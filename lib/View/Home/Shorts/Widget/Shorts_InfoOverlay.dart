import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Widgets/Custom_Text.dart';

class ShortsInfoOverlay extends StatelessWidget {
  final String title;
  final String description;
  final String? profileImage;
  final bool isExpanded;
  final VoidCallback onMoreTap;

  const ShortsInfoOverlay({
    super.key,
    required this.title,
    required this.description,
    this.profileImage,
    required this.isExpanded,
    required this.onMoreTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            if (profileImage != null)
              Container(
                height: 28.w,
                width: 28.w,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color(0xFFEBEBEB), // border color
                  ),
                ),
                child: CircleAvatar(backgroundImage: AssetImage(profileImage!)),
              ),
            if (profileImage != null) SizedBox(width: 6.w),
            CustomText(
              text: title,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: Color(0xFFFFFFFF),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        SizedBox(
          width: 280.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: description,
                fontSize: 10.sp,
                fontWeight: FontWeight.w400,
                color: Color(0xFFD8D8D8),
                overflow: TextOverflow.ellipsis,
                maxLines: isExpanded ? 10 : 2,
              ),
              SizedBox(height: 5.h),
              GestureDetector(
                onTap: onMoreTap,
                child: CustomText(
                  text: isExpanded ? " Less" : " More",
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFFE6B323),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
