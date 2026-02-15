import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:uremz100/Utils/app_colors.dart';
import 'package:uremz100/Utils/app_icons.dart';
import 'package:uremz100/Widgets/Custom_Text.dart';
import '../Bottom_NabBar/Controller/Bottom_NabBar_Controller.dart';
import 'Widget/subscribe_widgets.dart';

class SubscribeScreen extends StatelessWidget {
  const SubscribeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NavigationController navController = Get.find<NavigationController>();

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50.h),
            const ProfileHeader(),
            SizedBox(height: 10.h),
            _buildSectionTitle("Subscribe"),
            SizedBox(height: 16.h),
            SubscribeCard(
              title: "Weekly Pass Pro",
              price: "1,500",
              features: [
                SubscribeFeature(
                  label: "Short Drama Viewing",
                  iconPath: AppIcons.drama_icon,
                ),
                SubscribeFeature(
                  label: "Ad-Free",
                  iconPath: AppIcons.ad_free_icon,
                ),
                SubscribeFeature(
                  label: "Daily VIP Reward",
                  iconPath: AppIcons.rewards_icon,
                ),
                SubscribeFeature(
                  label: "1080p Full HD",
                  iconPath: AppIcons.full_hd_icon,
                ),
              ],
            ),
            SubscribeCard(
              title: "Monthly Pass Pro",
              price: "2,500",
              features: [
                SubscribeFeature(
                  label: "Short Drama Viewing",
                  iconPath: AppIcons.drama_icon,
                ),
                SubscribeFeature(
                  label: "Ad-Free",
                  iconPath: AppIcons.ad_free_icon,
                ),
                SubscribeFeature(
                  label: "Daily VIP Reward",
                  iconPath: AppIcons.rewards_icon,
                ),
                SubscribeFeature(
                  label: "1080p Full HD",
                  iconPath: AppIcons.full_hd_icon,
                ),
              ],
            ),
            SubscribeCard(
              title: "Yearly VIP",
              price: "4,500",
              features: [
                SubscribeFeature(
                  label: "Short Drama Viewing",
                  iconPath: AppIcons.drama_icon,
                ),
                SubscribeFeature(
                  label: "Offline Download",
                  iconPath: AppIcons.download_two_icon,
                ),
                SubscribeFeature(
                  label: "Daily VIP Reward",
                  iconPath: AppIcons.rewards_icon,
                ),
                SubscribeFeature(
                  label: "1080p Full HD",
                  iconPath: AppIcons.full_hd_icon,
                ),
              ],
            ),
            _buildSectionTitle("Refill"),
            SizedBox(height: 16.h),
            Row(
              children: [
                Expanded(
                  child: RefillCard(
                    coins: "300 + 30",
                    bonus: "",
                    price: "15.08",
                    discount: "10%",
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: RefillCard(
                    coins: "250 + 20",
                    bonus: "",
                    price: "10.08",
                    discount: "10%",
                  ),
                ),
              ],
            ),
            SizedBox(height: 14.h),
            Row(
              children: [
                Expanded(
                  child: RefillCard(
                    coins: "300 + 30",
                    bonus: "",
                    price: "15.08",
                    discount: "10%",
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: RefillCard(
                    coins: "300 + 30",
                    bonus: "",
                    price: "15.08",
                    discount: "10%",
                  ),
                ),
              ],
            ),
            SizedBox(height: 14.h),
            _buildSectionTitle("About Subscription"),
            SizedBox(height: 16.h),
            SubscriptionRules(),
            SizedBox(height: 40.h),
          ],
        ),
      ),
      bottomNavigationBar: Obx(
        () => Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
          decoration: const BoxDecoration(color: Colors.black),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(
              5,
              (index) => _buildCustomIcon(index, navController),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return CustomText(
      text: title,
      fontSize: 18.sp,
      fontWeight: FontWeight.w700,
      color: Colors.white,
    );
  }

  Widget _buildCustomIcon(int index, NavigationController navController) {
    final bool isSelected = navController.currentIndex.value == index;

    return GestureDetector(
      onTap: () {
        navController.changeIndex(index);
        Get.back();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(_getSvgForIndex(index), width: 24.w, height: 24.w),
          SizedBox(height: 6.h),
          Text(
            _getLabelForIndex(index),
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.w400,
              color: isSelected ? Colors.white : AppColors.gray400,
            ),
          ),
        ],
      ),
    );
  }

  String _getSvgForIndex(int index) {
    switch (index) {
      case 0:
        return AppIcons.discover_icon;
      case 1:
        return AppIcons.shorts_icon;
      case 2:
        return AppIcons.my_list_icon;
      case 3:
        return AppIcons.rewards_icon;
      case 4:
        return AppIcons.profile_icon;
      default:
        return '';
    }
  }

  String _getLabelForIndex(int index) {
    switch (index) {
      case 0:
        return 'Discover';
      case 1:
        return 'Shorts';
      case 2:
        return 'My List';
      case 3:
        return 'Rewards';
      case 4:
        return 'Profile';
      default:
        return '';
    }
  }
}
