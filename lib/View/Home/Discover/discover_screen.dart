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
                child: Obx(() {
                  final tab = controller.selectedTab.value;
                  if (tab == 2) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SectionHeader(title: "Top VIP Picks"),
                        Padding(
                          padding: EdgeInsets.only(bottom: 8.h),
                          child: Row(
                            children: [
                              _buildVipFilterChip(0, "Daily"),
                              _buildVipFilterChip(1, "Weekly"),
                            ],
                          ),
                        ),
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
                        const SectionHeader(title: "Only On ShortMax"),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 16.h,
                            crossAxisSpacing: 12.w,
                            childAspectRatio: 0.50,
                          ),
                          itemCount: controller.onlyOnShortMax.length,
                          itemBuilder: (context, index) {
                            final movie = controller.onlyOnShortMax[index];
                            return MovieCard(
                              title: movie.title,
                              imageUrl: movie.imageUrl,
                              views: movie.views,
                              width: double.infinity,
                              margin: EdgeInsets.zero,
                            );
                          },
                        ),
                        const SectionHeader(title: "Hot Now"),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 16.h,
                            crossAxisSpacing: 12.w,
                            childAspectRatio: 0.50,
                          ),
                          itemCount: controller.hotNow.length,
                          itemBuilder: (context, index) {
                            final movie = controller.hotNow[index];
                            return MovieCard(
                              title: movie.title,
                              imageUrl: movie.imageUrl,
                              views: movie.views,
                              badge: movie.badge,
                              isVip: movie.isVip,
                              width: double.infinity,
                              margin: EdgeInsets.zero,
                            );
                          },
                        ),
                        SizedBox(height: 50.h),
                      ],
                    );
                  } else if (tab == 3) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.h),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CustomText(
                                text: "Top Picks",
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
                        ListView.builder(
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
                        SizedBox(height: 50.h),
                      ],
                    );
                  } else if (tab == 5) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SectionHeader(title: "Categories"),
                        SizedBox(
                          height: 34.h,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.categories.length,
                            itemBuilder: (context, index) {
                              return _buildCategoryChip(index, controller.categories[index]);
                            },
                          ),
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 16.h,
                            crossAxisSpacing: 12.w,
                            childAspectRatio: 0.50,
                          ),
                          itemBuilder: (context, index) {
                            final movies = controller.getCategoryMovies(controller.selectedCategory.value);
                            final movie = movies[index];
                            return MovieCard(
                              title: movie.title,
                              imageUrl: movie.imageUrl,
                              views: movie.views,
                              badge: movie.badge,
                              width: double.infinity,
                              margin: EdgeInsets.zero,
                            );
                          },
                          itemCount: controller.getCategoryMovies(controller.selectedCategory.value).length,
                        ),
                        SizedBox(height: 50.h),
                      ],
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                ScreenUtil().screenWidth >= 480 ? 4 : 3,
                            mainAxisSpacing: 16.h,
                            crossAxisSpacing: 12.w,
                            childAspectRatio: 0.50,
                          ),
                          itemCount: controller.comingSoon.length,
                          itemBuilder: (context, index) {
                            final movie = controller.comingSoon[index];
                            return MovieCard(
                              title: movie.title,
                              imageUrl: movie.imageUrl,
                              badge: movie.badge,
                              views: movie.views,
                              width: double.infinity,
                              margin: EdgeInsets.zero,
                            );
                          },
                        ),
                        const SectionHeader(title: "New Release"),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 16.h,
                            crossAxisSpacing: 12.w,
                            childAspectRatio: 0.60,
                          ),
                          itemCount: controller.newRelease.length,
                          itemBuilder: (context, index) {
                            final movie = controller.newRelease[index];
                            return MovieCard(
                              title: movie.title,
                              imageUrl: movie.imageUrl,
                              badge: movie.badge,
                              views: movie.views,
                              width: double.infinity,
                              margin: EdgeInsets.zero,
                            );
                          },
                        ),
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
                        const SectionHeader(title: "You Might Like"),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisSpacing: 16.h,
                                  crossAxisSpacing: 12.w,
                                  childAspectRatio: 0.65,
                                ),
                                itemCount: controller.youMightLike.length,
                                itemBuilder: (context, index) {
                                  final movie = controller.youMightLike[index];
                                  return MovieCard(
                                    title: movie.title,
                                    imageUrl: movie.imageUrl,
                                    isVip: movie.isVip,
                                    views: movie.views,
                                    width: double.infinity,
                                    margin: EdgeInsets.zero,
                                  );
                                },
                              ),
                            ),
                            SizedBox(width: 12.w),
                            Expanded(
                              flex: 1,
                              child: _buildTopPicksCard(),
                            ),
                          ],
                        ),
                        const SectionHeader(title: "Most Popular Series"),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount:
                                ScreenUtil().screenWidth >= 480 ? 4 : 3,
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
                    );
                  }
                }),
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

  Widget _buildVipFilterChip(int index, String title) {
    return Obx(() {
      final isSelected = controller.selectedVipFilter.value == index;
      return GestureDetector(
        onTap: () => controller.changeVipFilter(index),
        child: Container(
          margin: EdgeInsets.only(right: 8.w),
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white.withOpacity(0.1) : Colors.transparent,
            border: Border.all(
              color: isSelected ? Colors.white.withOpacity(0.5) : Colors.white.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(6.r),
          ),
          child: CustomText(
            text: title,
            fontSize: 10.sp,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            color: isSelected ? Colors.white : Colors.white.withOpacity(0.6),
          ),
        ),
      );
    });
  }

  Widget _buildCategoryChip(int index, String title) {
    return Obx(() {
      final isSelected = controller.selectedCategory.value == index;
      return GestureDetector(
        onTap: () => Get.toNamed('/CategoryScreen', arguments: {'index': index}),
        child: Container(
          margin: EdgeInsets.only(right: 8.w),
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white.withOpacity(0.1) : Colors.transparent,
            border: Border.all(
              color: isSelected ? Colors.white.withOpacity(0.5) : Colors.white.withOpacity(0.2),
            ),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: CustomText(
            text: title,
            fontSize: 10.sp,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            color: isSelected ? Colors.white : Colors.white.withOpacity(0.6),
          ),
        ),
      );
    });
  }
}
  Widget _buildTopPicksCard() {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.06),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: "Top Picks",
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          SizedBox(height: 10.h),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: controller.rankingMovies.length > 4 ? 4 : controller.rankingMovies.length,
            itemBuilder: (context, index) {
              final m = controller.rankingMovies[index];
              return Padding(
                padding: EdgeInsets.only(bottom: 10.h),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.r),
                      child: Image.asset(
                        m.imageUrl,
                        width: 42.w,
                        height: 42.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            text: m.title,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 3.h),
                          Row(
                            children: [
                              Icon(Icons.local_fire_department, size: 12.sp, color: const Color(0xFFF35820)),
                              SizedBox(width: 4.w),
                              CustomText(
                                text: m.views ?? "",
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          SizedBox(height: 6.h),
          CustomText(
            text: "Explore More",
            fontSize: 10.sp,
            fontWeight: FontWeight.w600,
            color: Colors.white.withOpacity(0.8),
          ),
        ],
      ),
    );
  }
}
