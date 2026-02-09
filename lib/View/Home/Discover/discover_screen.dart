import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:uremz100/Utils/app_icons.dart';
import 'package:uremz100/Widgets/Custom_Text.dart';
import 'package:uremz100/Utils/app_colors.dart';
import 'Controller/discover_controller.dart';
import 'Widget/search_field_widget.dart';
import 'Widget/movie_card.dart';
import 'Widget/section_header.dart';
import 'Widget/ranking_item.dart';

class DiscoverScreen extends StatelessWidget {
  DiscoverScreen({super.key});

  final DiscoverController controller = Get.put(DiscoverController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar: Search and VIP
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: Row(
                children: [
                  Expanded(
                    child: Obx(
                      () => SearchFieldWidget(
                        hintText: controller.selectedTab.value == 0
                            ? "Popular movies"
                            : controller.selectedTab.value == 1
                            ? "New movies"
                            : "Action movies",
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  SvgPicture.asset(
                    AppIcons.vip_icon,
                    height: 36.w,
                    width: 36.w,
                  ), // Mock VIP icon
                ],
              ),
            ),

            // Horizontal Tab Bar
            Container(
              height: 62.h,
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: controller.mainTabs.length,
                itemBuilder: (context, index) {
                  return Obx(() {
                    final isSelected = controller.selectedTab.value == index;
                    return GestureDetector(
                      onTap: () => controller.changeTab(index),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        alignment: Alignment.center,
                        child: IntrinsicWidth(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CustomText(
                                text: controller.mainTabs[index],
                                fontSize: isSelected ? 18.sp : 16.sp,
                                fontWeight: isSelected
                                    ? FontWeight.w600
                                    : FontWeight.w400,
                                color: isSelected
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.5),
                                textAlign: TextAlign.center,
                              ),
                              if (isSelected)
                                Container(
                                  margin: EdgeInsets.only(top: 4.h),
                                  height: 2.5.h,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFF35820),
                                    borderRadius: BorderRadius.circular(2.r),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
                },
              ),
            ),
            // Main Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Coming Soon Section
                    SizedBox(
                      height: 215.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.comingSoon.length,
                        itemBuilder: (context, index) {
                          final movie = controller.comingSoon[index];
                          return MovieCard(
                            title: movie.title,
                            imageUrl: movie.imageUrl,
                            badge: movie.badge,
                          );
                        },
                      ),
                    ),

                    // New Release Section
                    const SectionHeader(title: "New Release"),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 16.h,
                        crossAxisSpacing: 12.w,
                        childAspectRatio: 0.50,
                      ),
                      itemCount: controller.newRelease.length,
                      itemBuilder: (context, index) {
                        final movie = controller.newRelease[index];
                        return MovieCard(
                          title: movie.title,
                          imageUrl: movie.imageUrl,
                          badge: movie.badge,
                          width: double.infinity,
                          margin: EdgeInsets.zero,
                        );
                      },
                    ),

                    // Top VIP Picks Section
                    const SectionHeader(title: "Top VIP Picks"),
                    SizedBox(
                      height: 215.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.topVipPicks.length,
                        itemBuilder: (context, index) {
                          final movie = controller.topVipPicks[index];
                          return MovieCard(
                            title: movie.title,
                            imageUrl: movie.imageUrl,
                            isVip: movie.isVip,
                            views: movie.views,
                          );
                        },
                      ),
                    ),

                    // Recently Watched Section
                    const SectionHeader(title: "Recently Watched"),
                    SizedBox(
                      height: 210.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.recentlyWatched.length,
                        itemBuilder: (context, index) {
                          final movie = controller.recentlyWatched[index];
                          return MovieCard(
                            title: movie.title,
                            imageUrl: movie.imageUrl,
                            badge: movie.badge,
                          );
                        },
                      ),
                    ),

                    // You Might Like Section
                    const SectionHeader(title: "You Might Like"),
                    SizedBox(
                      height: 215.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.youMightLike.length,
                        itemBuilder: (context, index) {
                          final movie = controller.youMightLike[index];
                          return MovieCard(
                            title: movie.title,
                            imageUrl: movie.imageUrl,
                            isVip: movie.isVip,
                            views: movie.views,
                          );
                        },
                      ),
                    ),

                    // Ranking Section
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            text: "Ranking",
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                          Row(
                            children: [
                              _buildRankingSubTab(0, "Popular"),
                              _buildRankingSubTab(1, "Monthly Top"),
                              _buildRankingSubTab(2, "Annual Top"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Obx(
                      () => ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: controller.rankingMovies.length,
                        itemBuilder: (context, index) {
                          final movie = controller.rankingMovies[index];
                          return RankingItem(
                            rank: movie.rank!,
                            title: movie.title,
                            imageUrl: movie.imageUrl,
                            views: movie.views!,
                            description: movie.description!,
                          );
                        },
                      ),
                    ),

                    // Most Popular Series Section
                    const SectionHeader(title: "Most Popular Series"),
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisSpacing: 16.h,
                        crossAxisSpacing: 12.w,
                        childAspectRatio: 0.50,
                      ),
                      itemCount: controller.mostPopularSeries.length,
                      itemBuilder: (context, index) {
                        final movie = controller.mostPopularSeries[index];
                        return MovieCard(
                          title: movie.title,
                          imageUrl: movie.imageUrl,
                          badge: movie.badge,
                          isVip: movie.isVip,
                          views: movie.views,
                          width: double.infinity,
                          margin: EdgeInsets.zero,
                        );
                      },
                    ),

                    SizedBox(height: 50.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRankingSubTab(int index, String title) {
    return Obx(() {
      final isSelected = controller.selectedRankingTab.value == index;
      return GestureDetector(
        onTap: () => controller.changeRankingTab(index),
        child: Container(
          margin: EdgeInsets.only(left: 12.w),
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          decoration: BoxDecoration(
            color: isSelected
                ? Colors.white.withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(4.r),
          ),
          child: CustomText(
            text: title,
            fontSize: 10.sp,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            color: isSelected ? Colors.white : Colors.white.withOpacity(0.3),
          ),
        ),
      );
    });
  }
}
