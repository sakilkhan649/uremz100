import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../Utils/app_icons.dart';
import '../../../../Utils/app_images.dart';
import '../../../../Widgets/Custom_Text.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.r),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 25.r,
            backgroundImage: const AssetImage(AppImages.profile_image),
          ),
          SizedBox(width: 10.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: "Md Ibrahim Kholil",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
                SizedBox(height: 4.h),
                CustomText(
                  text: "Join membership now for unlimited ad-free access",
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF9E9E9E),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SubscribeCard extends StatelessWidget {
  final String title;
  final String price;
  final List<SubscribeFeature> features;

  const SubscribeCard({
    super.key,
    required this.title,
    required this.price,
    required this.features,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color(0xFF151514), // dark brown-black (বেশিরভাগ অংশ)
            Color(0xFF3D2010), // সামান্য warm orange tint
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0.0, 1.0],
        ),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: Colors.white.withOpacity(0.08)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.vip_icon,
                    width: 28.w,
                    height: 28.w,
                  ),
                  SizedBox(width: 8.w),
                  CustomText(
                    text: title,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ],
              ),
              CustomText(
                text: "\$$price",
                fontSize: 20.sp,
                fontWeight: FontWeight.w700,
                color: const Color(0xFFFFD400),
              ),
            ],
          ),
          SizedBox(height: 4.h),
          CustomText(
            text: "Auto -renew. Cancel anytime.",
            fontSize: 12.sp,
            fontWeight: FontWeight.w400,
            color: const Color(0xFFCCCCCC),
          ),
          SizedBox(height: 20.h),
          Wrap(
            runSpacing: 12.h,
            children: features.map((feature) {
              return SizedBox(
                width: 0.4.sw,
                child: Row(
                  children: [
                    SvgPicture.asset(feature.iconPath!, width: 24.w),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: CustomText(
                        text: feature.label,
                        fontSize: 10.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class SubscribeFeature {
  final String label;
  final String? iconPath;
  final IconData? iconData;

  SubscribeFeature({required this.label, this.iconPath, this.iconData});
}

class RefillCard extends StatelessWidget {
  final String coins;
  final String bonus;
  final String price;
  final String? discount;

  const RefillCard({
    super.key,
    required this.coins,
    required this.bonus,
    required this.price,
    this.discount,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 10.h),
          decoration: BoxDecoration(
            color: Color(0xFF1F1F1F),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.rewards__rank_icon,
                    width: 20.w,
                    height: 20.w,
                  ),
                  SizedBox(width: 4.w),
                  CustomText(
                    text: "$coins",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFFFFD400),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              CustomText(
                text: "\$$price",
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: const Color(0xFFE0E0E0),
              ),
            ],
          ),
        ),
        if (discount != null)
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: const Color(0xFFE50913),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8.r),
                  bottomLeft: Radius.circular(8.r),
                ),
              ),
              child: CustomText(
                text: discount!,
                fontSize: 10.sp,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ),
      ],
    );
  }
}

class SubscriptionRules extends StatelessWidget {
  const SubscriptionRules({super.key});

  @override
  Widget build(BuildContext context) {
    final rules = [
      "Subscription Function is only to improve the user experience of the App. It does not affect the normal use of the app.",
      "Bonus can only be used to watch dramas, valid for 5 days, and will be automatically expired and liquidated after expiration.",
      "Gold coins will be used first when watching dramas, if not enough, Bonus will be used automatically.",
      "Gold coins will be used first when watching dramas, if not enough, Bonus will be used automatically.",
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: rules.asMap().entries.map((entry) {
        return Padding(
          padding: EdgeInsets.only(bottom: 12.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "${entry.key + 1}. ",
                fontSize: 12.sp,
                color: const Color(0xFFCFCDCD),
                fontWeight: FontWeight.w400,
              ),
              Expanded(
                child: CustomText(
                  text: entry.value,
                  fontSize: 12.sp,
                  color: const Color(0xFFCFCDCD),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
