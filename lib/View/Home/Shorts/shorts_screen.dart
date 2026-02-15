import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Utils/app_icons.dart';
import '../../../Utils/app_images.dart';
import '../../../Utils/app_colors.dart';
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
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5, // Mocking multiple shorts
        itemBuilder: (context, index) {
          return Stack(
            fit: StackFit.expand,
            children: [
              // Background Image
              Image.asset(AppImages.shorts_image, fit: BoxFit.cover),

              // Top Section (Back Button and Title)
              Positioned(
                top: 50.h,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () => Get.back(),
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 24.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Bottom Gradient Overlay for readability
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: 200.h,
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withOpacity(0.8),
                      ],
                    ),
                  ),
                ),
              ),

              // Right Side Action Buttons
              Positioned(
                right: 16.w,
                bottom: 40.h,
                child: Column(
                  children: [
                    // Profile/Avatar Icon
                    GestureDetector(
                      onTap: () {
                        controller.toggleLoginPopup();
                      },

                      child: CircleAvatar(
                        radius: 20.r,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 19.r,
                          backgroundImage: AssetImage(AppImages.profile_image),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // Favorite Button
                    Obx(
                      () => ShortsSideButton(
                        icon: Icon(
                          controller.isFav.value
                              ? Icons.star_rounded
                              : Icons.star_border_rounded,
                          color: const Color(0xFFFFC727),
                          size: 44.w,
                        ),
                        label: "15.5k",
                        onTap: () => controller.toggleLoginPopup(),
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // List Button
                    ShortsSideButton(
                      iconPath: AppIcons.list_icon,
                      label: "List",
                      onTap: () => controller.toggleLoginPopup(),
                    ),
                    SizedBox(height: 16.h),

                    // Share Button
                    ShortsSideButton(
                      iconPath: AppIcons.share_icon,
                      label: "Share",
                      onTap: () => controller.toggleLoginPopup(),
                    ),
                    SizedBox(height: 16.h),

                    // Download Button
                    ShortsSideButton(
                      iconPath: AppIcons.download_icon,
                      label: "Download",
                      onTap: () => controller.toggleLoginPopup(),
                    ),
                  ],
                ),
              ),

              // Bottom Info Section
              Positioned(
                left: 16.w,
                bottom: 50.h,
                child: const ShortsInfoOverlay(
                  title: "The Amazing Spiderman",
                  description:
                      "A young Peter Parker discovers his powers and learns that being a hero comes with responsibility..",
                ),
              ),

              // Bottom Divider (visible only on Shorts screen)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Divider(
                  color: AppColors.gray300,
                  thickness: 1,
                  height: 0.5,
                ),
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
          );
        },
      ),
    );
  }
}
