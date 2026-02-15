import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'Controller/discover_controller.dart';
import 'Widget/discrive_widget.dart';
import '../../../../Utils/app_images.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DiscoverController());
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),
                  DiscoverSearchBar(),
                  SizedBox(height: 18.h),
                  CategoryTabs(),
                  SizedBox(height: 20.h),
                  Obx(() {
                    switch (controller.selectedCategory.value) {
                      case 'Popular':
                        return _buildPopularView(controller);
                      case 'New':
                        return _buildNewView(controller);
                      case 'VIP':
                        return _buildVipView(controller);
                      case 'Ranking':
                        return _buildRankingView(controller);
                      default:
                        return _buildPopularView(controller);
                    }
                  }),
                  SizedBox(height: 100.h), // Space for bottom navigation
                ],
              ),
            ),
          ),
          Obx(
            () => controller.showBonusPopup.value
                ? DailyBonusPopup(onClose: controller.closePopup)
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildPopularView(DiscoverController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 4.h),
        _buildMovieGrid(controller.allMovies.take(3).toList(), 3),
        SizedBox(height: 24.h),
        const SectionHeader(title: "Recently Watched"),
        SizedBox(height: 12.h),
        _buildMovieGrid(controller.allMovies.take(2).toList(), 3),
        SizedBox(height: 24.h),
        const SectionHeader(title: "You Might Like"),
        SizedBox(height: 12.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 1, child: MovieCard(movie: controller.allMovies[0])),
            SizedBox(width: 12.w),
            Expanded(
              flex: 2,
              child: TopPicksList(
                movies: controller.allMovies.take(4).toList(),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        _buildMovieGrid(controller.allMovies.take(3).toList(), 3),
        SizedBox(height: 24.h),
        const SectionHeader(title: "Most Popular Series"),
        SizedBox(height: 12.h),
        _buildMovieGrid(controller.allMovies.take(3).toList(), 3),
      ],
    );
  }

  Widget _buildNewView(DiscoverController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: "Coming Soon"),
        SizedBox(height: 12.h),
        _buildMovieGrid(controller.allMovies.take(3).toList(), 3),
        SizedBox(height: 24.h),
        const SectionHeader(title: "New Release"),
        SizedBox(height: 12.h),
        _buildMovieGrid([...controller.allMovies, ...controller.allMovies], 3),
      ],
    );
  }

  Widget _buildVipView(DiscoverController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: "Top VIP Picks", onMore: () {}),
        SizedBox(height: 12.h),
        _buildMovieGrid(controller.allMovies.take(3).toList(), 3),
        SizedBox(height: 24.h),
        const SectionHeader(title: "Only On ShortMax"),
        SizedBox(height: 12.h),
        _buildMovieGrid(controller.allMovies.take(3).toList(), 3),
        SizedBox(height: 24.h),
        const SectionHeader(title: "Hot Now"),
        SizedBox(height: 12.h),
        _buildMovieGrid([...controller.allMovies, ...controller.allMovies], 3),
      ],
    );
  }

  Widget _buildRankingView(DiscoverController controller) {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
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

  Widget _buildMovieGrid(List<dynamic> items, int count) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: count,
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 10.w,
        childAspectRatio: 0.55,
      ),
      itemBuilder: (context, index) {
        return MovieCard(movie: items[index]);
      },
    );
  }

  Widget _buildSmallTab(String label, bool isSelected) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.black : const Color(0xFF8E8E8E),
          fontSize: 12.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildRankingItem(int index) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20.h),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.bottomLeft,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.asset(
                  AppImages.shorts_image, // Fixed path
                  width: 80.w,
                  height: 100.h,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
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
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w700,
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
                Text(
                  "Lycan Princess Won't Be Your",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  "An intense journey where danger, courage, and survival collide in a high-stakes battle.",
                  style: TextStyle(
                    color: const Color(0xFF8E8E8E),
                    fontSize: 10.sp,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          SizedBox(width: 12.w),
          Row(
            children: [
              Icon(
                Icons.local_fire_department,
                color: const Color(0xFFF76212),
                size: 16.sp,
              ),
              Text(
                "127k",
                style: TextStyle(
                  color: const Color(0xFFF76212),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
