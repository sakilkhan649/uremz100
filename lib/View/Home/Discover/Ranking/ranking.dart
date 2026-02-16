import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../Utils/app_icons.dart';
import '../Controller/discover_controller.dart';

class RankingView extends StatelessWidget {
  final DiscoverController controller;
  const RankingView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _buildSmallTab("Popular", true),
              SizedBox(width: 10.w),
              _buildSmallTab("Monthly Top", false),
              SizedBox(width: 10.w),
              _buildSmallTab("Annual Top", false),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: 7,
          itemBuilder: (context, index) {
            return _buildRankingItem(index);
          },
        ),
      ],
    );
  }

  Widget _buildSmallTab(String label, bool isSelected) {
    return Container(
      constraints: BoxConstraints(minWidth: 76.w),
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : Colors.black,
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(
          color: isSelected ? Colors.white : const Color(0xFF262626),
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          label,
          style: GoogleFonts.inter(
            color: isSelected ? Colors.black : const Color(0xFFD9D9D9),
            fontSize: 13.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildRankingItem(int index) {
    final movie = controller.allMovies[index % controller.allMovies.length];
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.asset(
                  movie.image,
                  width: 80.w,
                  height: 100.h,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF76212),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8.r),
                      bottomLeft: Radius.circular(8.r),
                    ),
                  ),
                  child: Text(
                    "${index + 1}",
                    style: GoogleFonts.inter(
                      color: Colors.white,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        movie.title,
                        style: GoogleFonts.inter(
                          color: Colors.white,
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppIcons.fire_icon,
                          width: 14.w,
                          height: 14.w,
                        ),
                        SizedBox(width: 4.w),
                        Text(
                          "${127 + index * 100}k",
                          style: GoogleFonts.inter(
                            color: const Color(0xFFF76212),
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                Padding(
                  padding: EdgeInsets.only(right: 60.w),
                  child: Text(
                    "An intense journey where danger, courage, and survival collide in a high-stakes battle.",
                    style: GoogleFonts.inter(
                      color: const Color(0xFFD9D9D9),
                      fontSize: 11.sp,
                      fontWeight: FontWeight.w400,
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
