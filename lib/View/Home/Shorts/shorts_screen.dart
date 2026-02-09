import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../Utils/app_icons.dart';
import '../../../Utils/app_images.dart';
import '../../../Utils/app_colors.dart';
import 'Controller/ShortsController.dart';
import 'Widget/ShortsSideButton.dart';
import 'Widget/ShortsInfoOverlay.dart';

class ShortsScreen extends StatelessWidget {
  const ShortsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ShortsController());

    return Scaffold(
      backgroundColor: AppColors.black100,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5, // Mocking multiple shorts
        itemBuilder: (context, index) {
          return Stack(
            fit: StackFit.expand,
            children: [
              // Background Image
              Image.asset(AppImages.shorts_image, fit: BoxFit.cover),

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
                      onTap: (){
                        //
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
                        onTap: () => controller.toggleFav(),
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // List Button
                    ShortsSideButton(
                      iconPath: AppIcons.list_icon,
                      label: "List",
                      onTap: () {},
                    ),
                    SizedBox(height: 16.h),

                    // Share Button
                    ShortsSideButton(
                      iconPath: AppIcons.share_icon,
                      label: "Share",
                      onTap: () {},
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
            ],
          );
        },
      ),
    );
  }
}
