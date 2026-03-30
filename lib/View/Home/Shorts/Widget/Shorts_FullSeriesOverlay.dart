import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../Utils/app_icons.dart';
import '../../../../Widgets/Custom_Text.dart';
import '../Controller/Shorts_Controller.dart';
import '../Model/shorts_model.dart';
import 'Shorts_InfoOverlay.dart';
import 'Shorts_SideButton.dart';
import 'Shorts_Overlay_Components.dart';

class ShortsFullSeriesOverlay extends StatelessWidget {
  final ShortsController controller;
  final ShortsModel shorts;
  final VoidCallback? onBack;

  const ShortsFullSeriesOverlay({
    super.key,
    required this.controller,
    required this.shorts,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        // Top Bar
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.fromLTRB(16.w, 50.h, 16.w, 20.h),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black.withOpacity(0.6), Colors.transparent],
              ),
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: onBack ?? () => controller.toggleFullSeriesMode(),
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 20.sp,
                  ),
                ),
                SizedBox(width: 10.w),
                CustomText(
                  text: "EP.11 Seaside",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () =>
                      controller.showPlaybackSpeedBottomSheet(shorts.videoUrl),
                  child: Row(
                    children: [
                      Icon(Icons.speed, color: Colors.white, size: 18.sp),
                      SizedBox(width: 4.w),
                      CustomText(
                        text: "Speed",
                        fontSize: 13.sp,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 16.w),
                GestureDetector(
                  onTap: () => controller.toggleMoreMenu(),
                  child: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                    size: 24.sp,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Central Play Button
        ShortsOverlayComponents.buildCentralPlayButton(shorts.videoUrl),

        // Right Side Buttons
        Positioned(
          right: 16.w,
          bottom: 150.h,
          child: Column(
            children: [
              ShortsSideButton(
                iconPath: AppIcons.save_icon,
                label: "359K",
                onTap: () => controller.toggleBookmark(),
              ),
              SizedBox(height: 16.h),
              ShortsSideButton(
                iconPath: AppIcons.episode_icon,
                label: "Episodes",
                onTap: () => controller.toggleEpisodePopup(),
              ),
              SizedBox(height: 16.h),
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
          bottom: 80.h,
          child: Obx(
                () => ShortsInfoOverlay(
              title: shorts.title,
              description: shorts.description,
              isEpisodeInfo: false,
              isExpanded: controller.isDescriptionExpanded.value,
              onMoreTap: () => controller.toggleDescription(),
            ),
          ),
        ),

        // Progress Bar (Full Series View)
        Positioned(
          bottom: 55.h,
          left: 10.w,
          right: 10.w,
          child: ShortsOverlayComponents.buildVideoSlider(shorts.videoUrl),
        ),

        // Bottom VIP Bar
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
            color: Colors.black,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.w,
                    vertical: 6.h,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF0D68A).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      color: const Color(0xFFF0D68A),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.vignette,
                        color: const Color(0xFFF0D68A),
                        size: 16.sp,
                      ),
                      SizedBox(width: 6.w),
                      CustomText(
                        text: "Join membership",
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFFF0D68A),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
