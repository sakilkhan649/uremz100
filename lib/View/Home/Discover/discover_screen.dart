import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'Controller/discover_controller.dart';
import 'Widget/discrive_widget.dart';
import 'Popular/popular.dart';
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
                        return PopularView(controller: controller);
                      case 'New':
                        return _buildNewView(controller);
                      case 'VIP':
                        return _buildVipView(controller);
                      case 'Ranking':
                        return _buildRankingView(controller);
                      default:
                        return PopularView(controller: controller);
                    }
                  }),
                  SizedBox(height: 40.h), // Space for bottom navigation
                ],
              ),
            ),
          ),
          Obx(
            () => controller.showBonusPopup.value
                ? DailyBonusPopup(onClose: controller.closePopup)
                : SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildNewView(DiscoverController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: "Coming Soon"),
        SizedBox(height: 12.h),
        MovieGrid(items: controller.allMovies.take(3).toList(), count: 3),
        SizedBox(height: 24.h),
        SectionHeader(title: "New Release"),
        SizedBox(height: 12.h),
        MovieGrid(
          items: [...controller.allMovies, ...controller.allMovies],
          count: 3,
        ),
      ],
    );
  }

  Widget _buildVipView(DiscoverController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: "Top VIP Picks", onMore: () {}),
        SizedBox(height: 12.h),
        MovieGrid(items: controller.allMovies.take(3).toList(), count: 3),
        SizedBox(height: 24.h),
        SectionHeader(title: "Only On ShortMax"),
        SizedBox(height: 12.h),
        MovieGrid(items: controller.allMovies.take(3).toList(), count: 3),
        SizedBox(height: 24.h),
        SectionHeader(title: "Hot Now"),
        SizedBox(height: 12.h),
        MovieGrid(
          items: [...controller.allMovies, ...controller.allMovies],
          count: 3,
        ),
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
          physics: NeverScrollableScrollPhysics(),
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
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : const Color(0xFF1A1A1A),
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: Colors.white.withOpacity(0.1)),
      ),
      child: Text(
        label,
        style: GoogleFonts.inter(
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
                  style: GoogleFonts.inter(
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
