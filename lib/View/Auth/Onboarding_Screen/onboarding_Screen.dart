import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uremz100/Utils/app_colors.dart';
import 'package:uremz100/Widgets/Custom_Button.dart';
import '../../../Core/Routs/routs.dart';
import 'controller/onboard_controller.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({super.key});

  final controller = OnboardingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.light,
        ),
      ),
      body: Stack(
        children: [
          // PageView for Images and Text Content
          PageView.builder(
            onPageChanged: controller.selectedPageIndex,
            itemCount: controller.onboardingpage.length,
            itemBuilder: (context, index) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  // Background Image
                  Image.asset(
                    controller.onboardingpage[index].imageAsesst,
                    fit: BoxFit.cover,
                  ),

                  // Content Container with Gradient Effect
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            controller.onboardingpage[index].gradientStartColor
                                .withOpacity(0.7),
                            controller.onboardingpage[index].gradientStartColor
                                .withOpacity(0.6),
                            controller.onboardingpage[index].gradientStartColor
                                .withOpacity(0.7),
                            controller.onboardingpage[index].gradientEndColor,
                          ],
                          stops: [0.0, 0.3, 0.6, 1.0],
                        ),
                      ),
                      padding: EdgeInsets.only(top: 50.h, bottom: 160.h),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Title
                            Text(
                              controller.onboardingpage[index].title,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.inter(
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                height: 1.2,
                              ),
                            ),
                            SizedBox(height: 16.h),

                            // Description
                            Text(
                              controller.onboardingpage[index].descripsion,
                              textAlign: TextAlign.center,
                              maxLines: 3,
                              style: GoogleFonts.inter(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.white.withOpacity(0.8),
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),

          // Fixed Page Indicators
          Positioned(
            bottom: 130.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.onboardingpage.length,
                (i) => Obx(() {
                  bool isActive = controller.selectedPageIndex.value == i;
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: 6.h,
                    width: isActive ? 24.w : 6.w,
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    decoration: BoxDecoration(
                      color: isActive ? AppColors.red100 : Colors.white,
                      borderRadius: BorderRadius.circular(3.r),
                    ),
                  );
                }),
              ),
            ),
          ),

          // Fixed Get Started Button
          Positioned(
            bottom: 40.h,
            left: 20.w,
            right: 20.w,
            child: CustomButton(
              text: "Get Started",
              onPressed: () {
                Get.offNamed(Routes.signinAndSignupScreen);
              },
            ),
          ),
        ],
      ),
    );
  }
}
