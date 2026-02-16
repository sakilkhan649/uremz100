import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'Controller/discover_controller.dart';
import 'Widget/DailyBonusPopup.dart';
import 'Widget/discrive_widget.dart';
import 'Popular/popular.dart';
import 'New/new.dart';
import 'Vip/vip.dart';
import 'Ranking/ranking.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DiscoverController());
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      SizedBox(height: 10.h),
                      const DiscoverSearchBar(),
                      SizedBox(height: 18.h),
                      const CategoryTabs(),
                      SizedBox(height: 5.h),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      children: [
                        Obx(() {
                          switch (controller.selectedCategory.value) {
                            case 'Popular':
                              return PopularView(controller: controller);
                            case 'New':
                              return NewView(controller: controller);
                            case 'VIP':
                              return VipView(controller: controller);
                            case 'Ranking':
                              return RankingView(controller: controller);
                            default:
                              return PopularView(controller: controller);
                          }
                        }),
                        SizedBox(height: 40.h), // Space for bottom navigation
                      ],
                    ),
                  ),
                ),
              ],
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
}
