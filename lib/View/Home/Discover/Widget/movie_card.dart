import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uremz100/Widgets/Custom_Text.dart';
import 'package:uremz100/Utils/app_colors.dart';

class MovieCard extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String? badge;
  final String? views;
  final bool isVip;
  final double? width;
  final double? height;
  final EdgeInsets? margin;

  const MovieCard({
    super.key,
    required this.title,
    required this.imageUrl,
    this.badge,
    this.views,
    this.isVip = false,
    this.width,
    this.height,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 110.w,
      margin: margin ?? EdgeInsets.only(right: 12.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
                  imageUrl,
                  height: height ?? 160.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              if (badge != null)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 6.w,
                      vertical: 2.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.orange100,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10.r),
                        bottomLeft: Radius.circular(10.r),
                      ),
                    ),
                    child: CustomText(
                      text: badge!,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              if (isVip)
                Positioned(
                  top: 6.h,
                  right: 6.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 4.w,
                      vertical: 1.h,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.yellow100,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: CustomText(
                      text: "VIP",
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w800,
                      color: Colors.black,
                    ),
                  ),
                ),
              Positioned(
                bottom: 6.h,
                right: 6.w,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 22.w,
                      height: 22.w,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.80),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.play_arrow,
                          color: Colors.white,
                          size: 13.sp,
                        ),
                      ),
                    ),
                    SizedBox(width: 6.w),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 3.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.80),
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      child: CustomText(
                        text: views ?? "12.1M",
                        fontSize: 11.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          CustomText(
            text: title,
            fontSize: 14.sp,
            color: Colors.white,
            fontWeight: FontWeight.w700,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
