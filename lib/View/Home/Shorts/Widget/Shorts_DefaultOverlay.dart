import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../Core/Routs/routs.dart';
import '../../../../Utils/app_icons.dart';
import '../../../../Widgets/Custom_Text.dart';
import '../Controller/Shorts_Controller.dart';
import '../Model/shorts_model.dart';
import 'Shorts_InfoOverlay.dart';
import 'Shorts_SideButton.dart';
import 'Shorts_Overlay_Components.dart';

class ShortsDefaultOverlay extends StatelessWidget {
  final ShortsController controller;
  final ShortsModel shorts;

  const ShortsDefaultOverlay({
    super.key,
    required this.controller,
    required this.shorts,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Top Gradient
        ShortsOverlayComponents.buildGradient(
          Alignment.topCenter,
          Alignment.bottomCenter,
          150.h,
        ),

        // Reward Icon with Close Button (Top Right)
        Obx(
          () => controller.showRewardIcon.value
              ? Positioned(
                  top: 30.h,
                  right: 10.w,
                  child: SizedBox(
                    width: 60.w, // Large enough to cover coin and close button
                    height: 60.h,
                    child: Stack(
                      children: [
                        // Main Reward Coin
                        Positioned(
                          bottom: 10,
                          left: 20,
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.rewardsScreen);
                            },
                            child: SvgPicture.asset(
                              AppIcons.short_reword_icon,
                              width: 24.w,
                              height: 24.w,
                            ),
                          ),
                        ),
                        // Close Button (Top Right)
                        Positioned(
                          top: -0,
                          right: 8,
                          child: GestureDetector(
                            onTap: () {
                              controller.showRewardIcon.value = false;
                            },
                            child: Container(
                              padding: EdgeInsets.all(4.r),
                              decoration: const BoxDecoration(
                                color: Color(0xFF292929),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                                size: 10.sp,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ),

        // Central Play Button
        ShortsOverlayComponents.buildCentralPlayButton(shorts.videoUrl),

        // Right Side Buttons
        Positioned(
          right: 16.w,
          bottom: 120.h,
          child: Column(
            children: [
              ShortsSideButton(
                iconPath: AppIcons.save_icon,
                label: "359K",
                onTap: () => controller.toggleBookmark(),
              ),
              SizedBox(height: 20.h),
              ShortsSideButton(
                iconPath: AppIcons.share_icon,
                label: "Share",
                onTap: () {},
              ),
            ],
          ),
        ),

        // Bottom Info
        Positioned(
          left: 16.w,
          bottom: 110.h,
          child: Obx(
            () => ShortsInfoOverlay(
              title: shorts.title,
              description: shorts.description,
              tags: shorts.tags,
              isEpisodeInfo: true,
              isExpanded: controller.isDescriptionExpanded.value,
              onMoreTap: () => controller.toggleDescription(),
            ),
          ),
        ),
        // More Button
        Positioned(
          left: 16.w,
          bottom: 85.h,
          child: GestureDetector(
            onTap: () => Get.toNamed(Routes.moreScreen),
            child: CustomText(
              text: "More",
              fontSize: 12.sp,
              fontWeight: FontWeight.w600,
              color: const Color(0xFFE6B323),
            ),
          ),
        ),

        // Watch Full Series Button
        Positioned(
          left: 16.w,
          right: 16.w,
          bottom: 30.h,
          child: GestureDetector(
            onTap: () => controller.toggleFullSeriesMode(),
            child: Container(
              height: 48.h,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.30),
                borderRadius: BorderRadius.circular(8.r),
              ),
              alignment: Alignment.center,
              child: CustomText(
                text: "Watch Full Series",
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
        ),

        // Progress Bar (Shorts View)
        Positioned(
          bottom: 4.h,
          left: 10.w,
          right: 10.w,
          child: ShortsOverlayComponents.buildVideoSlider(shorts.videoUrl),
        ),
      ],
    );
  }
}
