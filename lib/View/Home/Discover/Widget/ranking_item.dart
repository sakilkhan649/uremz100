import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uremz100/Widgets/Custom_Text.dart';
import 'package:uremz100/Utils/app_colors.dart';

class RankingItem extends StatelessWidget {
  final int rank;
  final String title;
  final String imageUrl;
  final String views;
  final String description;

  const RankingItem({
    super.key,
    required this.rank,
    required this.title,
    required this.imageUrl,
    required this.views,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Rank Number
          SizedBox(
            width: 30.w,
            child: CustomText(
              text: rank.toString(),
              fontSize: 18.sp,
              fontWeight: FontWeight.w800,
              color: rank <= 3
                  ? AppColors.orange100
                  : Colors.white.withOpacity(0.5),
            ),
          ),
          // Movie Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.asset(
              imageUrl,
              height: 100.h,
              width: 75.w,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 12.w),
          // Title and Description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                CustomText(
                  text: description,
                  fontSize: 10.sp,
                  color: Colors.white.withOpacity(0.5),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(width: 8.w),
          // Views/Flame Icon
          Row(
            children: [
              Icon(
                Icons.local_fire_department,
                color: AppColors.orange100,
                size: 16.sp,
              ),
              SizedBox(width: 2.w),
              CustomText(
                text: views,
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.orange100,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
