import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:uremz100/Core/Routs/routs.dart';
import 'package:uremz100/Utils/app_icons.dart';
import 'package:uremz100/View/Home/Discover/Models/discrive_models.dart';
import 'package:uremz100/Widgets/Custom_Text.dart';
import '../Controller/discover_controller.dart';
import '../New/new.dart';
import '../Widget/discrive_widget.dart';

class PopularView extends StatelessWidget {
  final DiscoverController controller;
  const PopularView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),
        // First Row (3-column)
        _buildStandardGrid(controller.allMovies.sublist(0, 3)),

        // VIP Banner
        _buildVipBanner(),

        // Second Row (3-column)
        _buildStandardGrid(controller.allMovies.sublist(3, 6)),

        SizedBox(height: 24.h),
        SectionHeader(title: "Most Popular Series"),
        SizedBox(height: 12.h),
        // Custom Grid for Most Popular Series
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildSeriesCard(
                movie: controller.allMovies[1],
                badge: "New",
                title: "Crimson Chars",
                subtitle: "Exclusive",
                views: "3.1M",
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: _buildSeriesCard(
                movie: controller.allMovies[2],
                badge: "VIP",
                title: "Crimson Chars",
                subtitle: "Revenge",
                views: "5.1M",
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: _buildSeriesCard(
                movie: controller.allMovies[3],
                badge: "Hot",
                title: "Mega",
                subtitle: "New Day",
                views: "12.1M",
              ),
            ),
          ],
        ),

        SizedBox(height: 24.h),
        SectionHeader(title: "You Might Like"),
        SizedBox(height: 16.h),

        // You Might Like Layout (Large Card + Top Picks List)
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildLargeMovieCard(
                movie: controller.allMovies[1],
                badge: "VIP",
                title: "Crimson Chars",
                subtitle: "Exclusive",
                views: "3.1M",
                height: 280.h,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: TopPicksList(movies: controller.allMovies.sublist(6, 11)),
            ),
          ],
        ),

        SizedBox(height: 16.h),

        // Staggered Section (Below You Might Like)
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  _buildLargeMovieCard(
                    movie: controller.allMovies[3],
                    badge: null,
                    title: "Crimson Chars",
                    subtitle: "Exclusive",
                    views: "3.1M",
                    height: 280.h,
                  ),
                  SizedBox(height: 16.h),
                  _buildLargeMovieCard(
                    movie: controller.allMovies[0],
                    badge: "VIP",
                    title: "Crimson Chars",
                    subtitle: "Exclusive",
                    views: "3.1M",
                    height: 280.h,
                  ),
                  SizedBox(height: 16.h),
                  _buildLargeMovieCard(
                    movie: controller.allMovies[2],
                    badge: null,
                    title: "Crimson Chars",
                    subtitle: "Exclusive",
                    views: "3.1M",
                    height: 280.h,
                  ),
                ],
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                children: [
                  _buildFindOutMore(),
                  SizedBox(height: 16.h),
                  _buildLargeMovieCard(
                    movie: controller.allMovies[4],
                    badge: "New",
                    title: "Crimson Chars",
                    subtitle: "Exclusive",
                    views: "3.1M",
                    height: 280.h,
                  ),
                  SizedBox(height: 16.h),
                  _buildLargeMovieCard(
                    movie: controller.allMovies[5],
                    badge: "VIP",
                    title: "Crimson Chars",
                    subtitle: "Exclusive",
                    views: "3.1M",
                    height: 280.h,
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: 24.h),
        SectionHeader(title: "Recently Watched"),
        SizedBox(height: 12.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildRecentlyWatchedCard(
                movie: controller.allMovies[4],
                badge: "Exclusive",
                views: "3.1M",
                progress: 0.3,
                overlayMovie: controller.allMovies[0],
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: _buildRecentlyWatchedCard(
                movie: controller.allMovies[5],
                views: "225.1k",
                progress: 0.6,
              ),
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: _buildRecentlyWatchedCard(
                movie: controller.allMovies[6],
                badge: "New",
                views: "3.1M",
                progress: 0.8,
              ),
            ),
          ],
        ),
      ],
    );
  }

  // --- Standard 3-column Grid Builder ---
  Widget _buildStandardGrid(List<DiscoverMovie> items) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items.map((movie) {
        return Expanded(
          child: Padding(
            padding: EdgeInsets.only(right: movie == items.last ? 0 : 10.w),
            child: _buildStandardMovieCard(movie),
          ),
        );
      }).toList(),
    );
  }

  // --- Standard Movie Card (Consistent sizing) ---
  Widget _buildStandardMovieCard(DiscoverMovie movie) {
    return GestureDetector(
      onTap: () => controller.openMoviePopup(movie),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
                  movie.image,
                  height: 145.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              if (movie.badge != null)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF76212),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12.r),
                        bottomLeft: Radius.circular(12.r),
                      ),
                    ),
                    child: CustomText(
                      text: movie.badge!,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              Positioned(
                bottom: 8.h,
                right: 8.w,
                child: Row(
                  children: [
                    Icon(Icons.play_arrow, color: Colors.white, size: 12.sp),
                    SizedBox(width: 2.w),
                    CustomText(
                      text: movie.views,
                      fontSize: 8.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          CustomText(
            text: movie.title,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            overflow: TextOverflow.ellipsis,
          ),
          CustomText(
            text: movie.subtitle,
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF8E8E8E),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildRecentlyWatchedCard({
    required DiscoverMovie movie,
    String? badge,
    required String views,
    required double progress,
    DiscoverMovie? overlayMovie,
  }) {
    return GestureDetector(
      onTap: () => controller.openMoviePopup(movie),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              // Main Image
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Stack(
                  children: [
                    Image.asset(
                      movie.image,
                      height: 150.h,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    // Progress Bar at Bottom
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: 3.h,
                        color: Colors.black.withOpacity(0.5),
                        child: FractionallySizedBox(
                          alignment: Alignment.centerLeft,
                          widthFactor: progress,
                          child: Container(color: Colors.red),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Badge
              if (badge != null)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF76212),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12.r),
                        bottomLeft: Radius.circular(12.r),
                      ),
                    ),
                    child: CustomText(
                      text: badge,
                      fontSize: 8.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              // Views
              Positioned(
                bottom: 8.h,
                right: 8.w,
                child: Row(
                  children: [
                    Icon(Icons.play_arrow, color: Colors.white, size: 12.sp),
                    SizedBox(width: 2.w),
                    CustomText(
                      text: views,
                      fontSize: 8.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
              // Close Button (X)
              if (overlayMovie != null)
                Positioned(
                  bottom: 40.h,
                  right: 20.w,
                  child: Container(
                    padding: EdgeInsets.all(2.r),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.close, size: 12.sp, color: Colors.black),
                  ),
                ),
              // Small Overlay Image
              if (overlayMovie != null)
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    width: 60.w,
                    height: 70.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      border: Border.all(color: Colors.white24, width: 1),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Stack(
                        children: [
                          Image.asset(
                            overlayMovie.image,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                          const Center(
                            child: Icon(
                              Icons.play_arrow,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(height: 8.h),
          CustomText(
            text: movie.title,
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            overflow: TextOverflow.ellipsis,
          ),
          CustomText(
            text: movie.subtitle,
            fontSize: 10.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF8E8E8E),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildLargeMovieCard({
    required DiscoverMovie movie,
    required String? badge,
    required String title,
    required String subtitle,
    required String views,
    double? height, // Added height parameter
  }) {
    return GestureDetector(
      onTap: () => controller.openMoviePopup(movie),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16.r),
                child: Image.asset(
                  movie.image,
                  height:
                      height ??
                      380.h, // Use provided height or default to 380.h
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // VIP Badge
              if (badge != null)
                Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 6.h,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF76212),
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(16.r),
                        bottomLeft: Radius.circular(16.r),
                      ),
                    ),
                    child: CustomText(
                      text: badge,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              // Views
              Positioned(
                bottom: 12.h,
                right: 12.w,
                child: Row(
                  children: [
                    Icon(Icons.play_arrow, color: Colors.white, size: 18.sp),
                    SizedBox(width: 4.w),
                    CustomText(
                      text: views,
                      fontSize: 12.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          CustomText(
            text: title,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: Colors.white,
            overflow: TextOverflow.ellipsis,
          ),
          CustomText(
            text: subtitle,
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF8E8E8E),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildVipBanner() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
      decoration: BoxDecoration(
        color: const Color(0xFFFFFDF6),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Left: Icon + Text
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.vip_icon,
                    height: 32.h,
                    width: 32.w,
                  ),
                  SizedBox(width: 8.w),
                  CustomText(
                    text: "Become a VIP",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF353534),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              CustomText(
                text: "Unlock All Short Dramas For free",
                fontSize: 12.sp,
                color: const Color(0xFF595959),
                fontWeight: FontWeight.w500,
              ),
            ],
          ),

          // Right: Go Button
          GestureDetector(
            onTap: () => Get.toNamed(Routes.rewardsScreen),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 8.h),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF602701), // orange — top left
                    Color(0xFFC65002), // dark brown — middle
                  ],
                ),
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: CustomText(
                text: "Go",
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: Color(0xFFFFFFFF),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFindOutMore() {
    final categories = [
      "Hidden Identity",
      "Love After Marriage",
      "Revenge",
      "Age Gap",
    ];
    return Transform.translate(
      offset: Offset(0, -10.h), // Move the card 10px up
      child: Container(
        padding: EdgeInsets.fromLTRB(14.w, 23.h, 14.w, 0.h),
        decoration: BoxDecoration(
          color: const Color(0xFF1D1817),
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
            stops: [0.0, 0.70, 2.0],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Find Out More",
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: const Color(0xFFF76212),
            ),
            SizedBox(height: 22.h),
            ...categories
                .map(
                  (cat) => Padding(
                    padding: EdgeInsets.only(bottom: 16.h),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 6.h),
                      decoration: BoxDecoration(
                        color: const Color(0xFF4A2B1E),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      alignment: Alignment.center,
                      child: CustomText(
                        text: cat,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFFFFFFFF),
                      ),
                    ),
                  ),
                )
                .toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildSeriesCard({
    required DiscoverMovie movie,
    required String badge,
    required String title,
    required String subtitle,
    required String views,
  }) {
    return GestureDetector(
      onTap: () => controller.openMoviePopup(movie),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.asset(
                  movie.image,
                  height: 150.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              // Badge
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 14.w,
                    vertical: 4.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF76212),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(12.r),
                      bottomLeft: Radius.circular(12.r),
                    ),
                  ),
                  child: CustomText(
                    text: badge,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
              // Views
              Positioned(
                bottom: 8.h,
                right: 8.w,
                child: Row(
                  children: [
                    Icon(Icons.play_arrow, color: Colors.white, size: 14.sp),
                    SizedBox(width: 2.w),
                    CustomText(
                      text: views,
                      fontSize: 10.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
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
            fontWeight: FontWeight.w500,
            color: Colors.white,
            overflow: TextOverflow.ellipsis,
          ),
          CustomText(
            text: subtitle,
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xFF8E8E8E),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
