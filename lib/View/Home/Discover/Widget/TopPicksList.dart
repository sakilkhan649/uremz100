import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../Utils/app_icons.dart';
import '../../../../Widgets/Custom_Text.dart';
import '../Detail/discover_detail_screen.dart';
import '../Models/discrive_models.dart';

class TopPicksList extends StatelessWidget {
  final List<DiscoverMovie> movies;
  const TopPicksList({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF994A24), // orange — top left
            Color(0xFF1B1616), // dark brown — middle
            Color(0xFF000000), // dark brown — middle
          ],
          stops: [0.0, 0.30, 2.0],
        ),
      ),
      padding: EdgeInsets.all(14.r),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: "Top Picks",
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFF76212),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          ...movies.asMap().entries.map((entry) {
            int idx = entry.key;
            DiscoverMovie movie = entry.value;
            return Padding(
              padding: EdgeInsets.only(bottom: 10.h),
              child: GestureDetector(
                onTap: () => Get.to(() => MovieDetailScreen(movie: movie)),
                child: Row(
                  children: [
                    Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.r),
                          child: Image.asset(
                            movie.image,
                            width: 64.w,
                            height: 74.w,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 4.w),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF76212),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(8.r),
                              bottomLeft: Radius.circular(8.r),
                            ),
                          ),
                          child: CustomText(
                            text: "${idx + 1}",
                            fontSize: 8.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: movie.title,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(
                                AppIcons.fire_icon,
                                width: 14.w,
                                height: 14.w,
                              ),
                              SizedBox(width: 4.w),
                              CustomText(
                                text: "307k",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFFF76212),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: "Explore More",
                fontSize: 10.sp,
                color: const Color(0xFFD9D9D9),
              ),
              SizedBox(width: 5.w),
              Icon(
                Icons.arrow_forward_ios,
                color: const Color(0xFFD9D9D9),
                size: 10.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
