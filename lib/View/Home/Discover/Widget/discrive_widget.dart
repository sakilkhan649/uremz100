import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../Utils/app_icons.dart';
import '../../../../Widgets/Custom_Text.dart';
import '../Controller/discover_controller.dart';
import 'MovieCard.dart';

export 'MovieCard.dart';
export 'TopPicksList.dart';

class DiscoverSearchBar extends StatelessWidget {
  const DiscoverSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
              color: Color(0xFF1D1817),
              borderRadius: BorderRadius.circular(8.r),
              border: Border.all(color: Colors.white),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(color: Colors.white, fontSize: 14.sp),
                    decoration: InputDecoration(
                      hintText: "Popular movies",
                      hintStyle: TextStyle(
                        color: Color(0xFFC5C5C5),
                        fontSize: 14.sp,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SvgPicture.asset(AppIcons.sech_icon, width: 20.w, height: 20.w),
              ],
            ),
          ),
        ),
        SizedBox(width: 12.w),
        SvgPicture.asset(AppIcons.vip_icon, width: 32.w, height: 32.w),
      ],
    );
  }
}

class CategoryTabs extends StatelessWidget {
  const CategoryTabs({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DiscoverController>();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: controller.categories.map((category) {
          return Obx(() {
            final isSelected = controller.selectedCategory.value == category;
            return GestureDetector(
              onTap: () => controller.changeCategory(category),
              child: Padding(
                padding: EdgeInsets.only(right: 24.w),
                child: IntrinsicWidth(
                  child: Column(
                    children: [
                      CustomText(
                        text: category,
                        fontSize: 16.sp,
                        fontWeight: isSelected
                            ? FontWeight.w700
                            : FontWeight.w400,
                        color: isSelected
                            ? Colors.white
                            : const Color(0xFF8E8E8E),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 4.h),
                        height: 2.h,
                        width: double.infinity,
                        color: isSelected
                            ? const Color(0xFFF76212)
                            : Colors.transparent,
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
        }).toList(),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onMore;
  const SectionHeader({super.key, required this.title, this.onMore});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: title,
          fontSize: 18.sp,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        if (onMore != null)
          GestureDetector(
            onTap: onMore,
            child: Icon(
              Icons.arrow_forward_ios,
              color: Colors.white.withOpacity(0.5),
              size: 16.sp,
            ),
          ),
      ],
    );
  }
}

class DailyBonusPopup extends StatelessWidget {
  final VoidCallback onClose;
  const DailyBonusPopup({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DiscoverController>();
    return Container(
      color: Colors.black.withOpacity(0.8),
      child: Center(
        child: Container(
          width: 300.w,
          padding: EdgeInsets.all(20.r),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF2E2E2E), Color(0xFF1A1A1A)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: GestureDetector(
                  onTap: onClose,
                  child: Icon(Icons.close, color: Colors.white, size: 20.sp),
                ),
              ),
              CustomText(
                text: "Claim Daily Bonus, Unlock New Episodes.",
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
                color: Colors.white,
              ),
              SizedBox(height: 20.h),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisSpacing: 10.h,
                  crossAxisSpacing: 10.w,
                  childAspectRatio: 0.7,
                ),
                itemCount: controller.dailyBonus.length,
                itemBuilder: (context, index) {
                  final bonus = controller.dailyBonus[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF333333),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.stars,
                          color: const Color(0xFFFFD400),
                          size: 20.sp,
                        ),
                        SizedBox(height: 4.h),
                        CustomText(
                          text: "+${bonus.coins}",
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                        CustomText(
                          text: bonus.time,
                          fontSize: 8.sp,
                          color: const Color(0xFF8E8E8E),
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
              Container(
                width: double.infinity,
                height: 44.h,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFF76212), Color(0xFFFF8E3C)],
                  ),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Center(
                  child: CustomText(
                    text: "Check-In",
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MovieGrid extends StatelessWidget {
  final List<dynamic> items;
  final int count;
  const MovieGrid({super.key, required this.items, required this.count});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: count,
        mainAxisSpacing: 10.h,
        crossAxisSpacing: 10.w,
        childAspectRatio: 0.52,
      ),
      itemBuilder: (context, index) {
        return MovieCard(movie: items[index]);
      },
    );
  }
}
