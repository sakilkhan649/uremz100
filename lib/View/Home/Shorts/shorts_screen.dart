import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../Utils/app_icons.dart';
import '../../../Utils/app_images.dart';
import '../../../Utils/app_colors.dart';
import '../../../Widgets/Custom_Text.dart';
import 'Controller/Shorts_Controller.dart';
import 'Widget/Shorts_InfoOverlay.dart';
import 'Widget/Shorts_SideButton.dart';
import 'Widget/Login_Popup.dart';
import '../../../Core/Routs/routs.dart';

class ShortsScreen extends StatelessWidget {
  const ShortsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ShortsController());
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  // Background Image
                  Image.asset(AppImages.move_7, fit: BoxFit.cover),

                  // Top Gradient
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    height: 120.h,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.5),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Bottom Gradient
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height: 300.h,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.8),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Right Side Action Buttons
                  Positioned(
                    right: 16.w,
                    bottom: 120.h,
                    child: Column(
                      children: [
                        // Bookmark Button
                        Obx(
                          () => ShortsSideButton(
                            iconPath: AppIcons.save_icon,
                            color: controller.isBookmarked.value
                                ? AppColors.orange100
                                : Colors.white,
                            label: "15.5k",
                            onTap: () => controller.toggleBookmark(),
                          ),
                        ),
                        SizedBox(height: 12.h),

                        // Favorite Button
                        Obx(
                          () => ShortsSideButton(
                            icon: Icon(
                              controller.isFav.value
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: controller.isFav.value
                                  ? Colors.red
                                  : Colors.white,
                              size: 32.sp,
                            ),
                            label: "14.4k",
                            onTap: () => controller.toggleFav(),
                          ),
                        ),
                        SizedBox(height: 12.h),

                        // Share Button
                        ShortsSideButton(
                          iconPath: AppIcons.share_icon,
                          label: "Share",
                          onTap: () {},
                        ),
                        SizedBox(height: 12.h),

                        // More Button
                        ShortsSideButton(
                          iconPath: AppIcons.more_icon,
                          onTap: () => controller.toggleMoreMenu(),
                        ),
                      ],
                    ),
                  ),

                  // Bottom Info Section
                  Positioned(
                    left: 16.w,
                    bottom: 130.h,
                    child: ShortsInfoOverlay(
                      profileImage: AppImages.profile_image,
                      title: "The Amazing Spiderman",
                      description:
                          "A young Peter Parker discovers his powers and learns that being a hero comes with responsibility..",
                    ),
                  ),

                  // Watch Now Button
                  Positioned(
                    left: 16.w,
                    right: 16.w,
                    bottom: 85.h,
                    child: Container(
                      height: 40.h,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8.r),
                        border: Border.all(color: Colors.white24),
                      ),
                      alignment: Alignment.center,
                      child: CustomText(
                        text: "Watch Now",
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  // Episode Bar
                  Positioned(
                    left: 16.w,
                    right: 16.w,
                    bottom: 45.h,
                    child: Container(
                      height: 36.h,
                      padding: EdgeInsets.symmetric(horizontal: 12.w),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.layers,
                            color: Colors.white70,
                            size: 16.sp,
                          ),
                          SizedBox(width: 8.w),
                          Obx(
                            () => CustomText(
                              text:
                                  "Episode ${controller.currentEpisode.value} • Season ${controller.currentSeason.value}",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                          ),
                          const Spacer(),
                          Icon(
                            Icons.keyboard_arrow_up,
                            color: Colors.white70,
                            size: 20.sp,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
          ),

          // More Menu Overlay
          Obx(
            () => controller.showMoreMenu.value
                ? GestureDetector(
                    onTap: () => controller.toggleMoreMenu(),
                    child: Container(
                      color: Colors.black45,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [_buildMoreMenu(controller)],
                      ),
                    ),
                  )
                : const SizedBox.shrink(),
          ),

          // Login Popup
          Obx(
            () => controller.showLoginPopup.value
                ? Container(
                    color: Colors.black.withOpacity(0.5),
                    child: LoginPopup(
                      onSignIn: () {
                        controller.toggleLoginPopup();
                        Get.toNamed(Routes.signinScreen);
                      },
                      onClose: () => controller.toggleLoginPopup(),
                    ),
                  )
                : const SizedBox.shrink(),
          ),
        ],
      ),
    );
  }

  Widget _buildMoreMenu(ShortsController controller) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: const Color(0xFF222222),
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: "More",
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
              IconButton(
                onPressed: () => controller.toggleMoreMenu(),
                icon: const Icon(Icons.close, color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          _buildMoreMenuItem(
            iconPath: AppIcons.speed_icon,
            title: "Playback Speed",
            value: controller.playbackSpeed.value,
            onTap: () {},
          ),
          _buildMoreMenuItem(
            iconPath: AppIcons.quality_icon,
            title: "Quality",
            value: controller.videoQuality.value,
            onTap: () {},
          ),
          _buildMoreMenuItem(
            iconPath: AppIcons.picture_icon,
            title: "Picture in Picture",
            trailing: Obx(
              () => Switch(
                value: controller.isPipEnabled.value,
                onChanged: (v) => controller.togglePip(),
                activeColor: AppColors.orange100,
              ),
            ),
            onTap: () {},
          ),
          _buildMoreMenuItem(
            iconPath: AppIcons.share_icon,
            title: "Share",
            onTap: () {},
          ),
          _buildMoreMenuItem(
            iconPath: AppIcons.report_icon,
            title: "Report",
            onTap: () {},
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  Widget _buildMoreMenuItem({
    required String iconPath,
    required String title,
    String? value,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: SvgPicture.asset(
        iconPath,
        color: Colors.white70,
        width: 24.sp,
        height: 24.sp,
      ),
      title: CustomText(
        text: title,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      trailing:
          trailing ??
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (value != null)
                CustomText(
                  text: value,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white70,
                ),
              SizedBox(width: 8.w),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white38,
                size: 14,
              ),
            ],
          ),
      onTap: onTap,
    );
  }
}
