import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:uremz100/Utils/app_colors.dart';
import 'package:uremz100/Utils/app_images.dart';
import 'package:uremz100/Widgets/Custom_AppBar.dart';
import 'package:uremz100/Widgets/Custom_Button.dart';
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
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        title: "Rewards",
        backgroundColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // 1. Background Image (Goes slightly under the container)
            Align(
              alignment: Alignment.topRight,
              child: Image.asset(
                AppImages.rewards_image,
                height: 365.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            // 2. Main Content
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Spacer for Header Text
                SizedBox(height: 110.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          CustomText(
                            text: "Quest ",
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                          CustomText(
                            text: "Coins,",
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w800,
                            color: AppColors.yellow100,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          CustomText(
                            text: "Unlock ",
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w800,
                            color: AppColors.yellow100,
                          ),
                          CustomText(
                            text: "Dramas",
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w800,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),

                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Rewards Progress Card (Overlaps the image)
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                          vertical: 22.h,
                          horizontal: 30.w,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16.r),
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFF6C4E32).withOpacity(0.5),
                              const Color(0xFF131416),
                              const Color(0xFF131416),
                            ],
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            stops: const [0.0, 0.4, 1.0],
                          ),
                        ),
                        child: Column(
                          children: [
                            CustomText(
                              text: "Watch Dramas And Quest Coins",
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                            SizedBox(height: 5.h),
                            CustomText(
                              text: "Watch 3 more mins +10 Coins",
                              fontSize: 12.sp,
                              color: Color(0xFFEDADA1),
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(height: 15.h),
                            Obx(
                              () => Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: controller.rewardsSteps.map((step) {
                                  return RewardStepWidget(
                                    coins: step.coins,
                                    time: step.time,
                                  );
                                }).toList(),
                              ),
                            ),
                            SizedBox(height: 22.h),
                            CustomButton(
                              text: "Quest Coins",
                              backgroundColor: AppColors.orange100,
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),

                      SizedBox(height: 24.h),

                      // Today's Benefits Section
                      CustomText(
                        text: "Today's Benefits",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                      SizedBox(height: 14.h),
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

                      SizedBox(height: 24.h),

                      // Description Section
                      CustomText(
                        text: "Description",
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: 12.h),
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
                                fontSize: 12.sp,
                                color: Color(0xFFCFCDCD),
                                fontWeight: FontWeight.w400,
                                maxLines: 5,
                                textAlign: TextAlign.start,
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 30.h),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
