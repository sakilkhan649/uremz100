import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:uremz100/Utils/app_colors.dart';
import 'package:uremz100/Utils/app_images.dart';
import 'package:uremz100/Widgets/Custom_AppBar.dart';
import 'package:uremz100/Widgets/Custom_Text.dart';
import 'Controller/rewards_controller.dart';
import 'Widget/reward_step_widget.dart';
import 'Widget/task_item_widget.dart';

class RewardsScreen extends StatelessWidget {
  RewardsScreen({super.key});

  final RewardsController controller = Get.put(RewardsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        title: "Rewards",
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Image with Text Overlay
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                    AppImages.rewards_image,
                    height: 240.h,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  bottom: 20.h,
                  left: 16.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            text: "Quest ",
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                          CustomText(
                            text: "Coins,",
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.yellow100,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: "Unlock ",
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.yellow100,
                          ),
                          CustomText(
                            text: "Dramas",
                            fontSize: 28.sp,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 10.h),

                  // Rewards Progress Card
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(20.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      gradient: LinearGradient(
                        colors: [
                          const Color(0xFF6C4E32).withOpacity(0.6),
                          const Color(0xFF1A1B20).withOpacity(0.9),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      border: Border.all(color: Colors.white.withOpacity(0.05)),
                    ),
                    child: Column(
                      children: [
                        CustomText(
                          text: "Watch Dramas And Quest Coins",
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                        SizedBox(height: 8.h),
                        CustomText(
                          text: "Watch 3 more mins +10 Coins",
                          fontSize: 12.sp,
                          color: AppColors.gray200,
                        ),
                        SizedBox(height: 20.h),
                        Obx(
                          () => Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: controller.rewardsSteps.map((step) {
                              return RewardStepWidget(
                                coins: step.coins,
                                time: step.time,
                              );
                            }).toList(),
                          ),
                        ),
                        SizedBox(height: 20.h),
                        SizedBox(
                          width: double.infinity,
                          height: 48.h,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.orange100,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            child: CustomText(
                              text: "Quest Coins",
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 30.h),

                  // Today's Benefits Section
                  CustomText(
                    text: "Today's Benefits",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  SizedBox(height: 10.h),
                  Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.todayBenefits.length,
                      itemBuilder: (context, index) {
                        final item = controller.todayBenefits[index];
                        return TaskItemWidget(
                          title: item.title,
                          subtitle: item.subtitle,
                          coinsLabel: item.coinsLabel,
                          buttonText: item.buttonText,
                          isHighlight: item.isHighlight,
                          layoutType: item.layoutType,
                          onTap: () {},
                        );
                      },
                    ),
                  ),

                  SizedBox(height: 30.h),

                  // Description Section
                  CustomText(
                    text: "Description",
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                  SizedBox(height: 16.h),
                  Obx(
                    () => ListView.builder(
                      shrinkWrap: true,
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: controller.descriptions.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: 12.h),
                          child: CustomText(
                            text: controller.descriptions[index],
                            fontSize: 13.sp,
                            color: AppColors.gray200,
                            maxLines: 5,
                            textAlign: TextAlign.start,
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 50.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
