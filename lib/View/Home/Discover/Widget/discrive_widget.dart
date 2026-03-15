import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:uremz100/View/Home/Discover/Models/discrive_models.dart';
import '../../../../Core/Routs/routs.dart';
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
        GestureDetector(
          onTap: () {
            Get.toNamed(Routes.standardVip);
          },
          child: SvgPicture.asset(AppIcons.vip_icon, width: 32.w, height: 32.w),
        ),
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
        mainAxisSpacing: 0.h,
        crossAxisSpacing: 10.w,
        childAspectRatio: 0.52,
      ),
      itemBuilder: (context, index) {
        return MovieCard(movie: items[index]);
      },
    );
  }
}

class MovieDetailsPopup extends StatelessWidget {
  final DiscoverMovie movie;
  final VoidCallback onClose;

  const MovieDetailsPopup({
    super.key,
    required this.movie,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: GestureDetector(
        onTap: onClose,
        child: Container(
          color: Colors.black.withOpacity(0.8),
          alignment: Alignment.center,
          child: GestureDetector(
            onTap: () {}, // Prevent closing when clicking inside
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 310.w,
                  decoration: BoxDecoration(
                    color: const Color(0xFF1A1A1A),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 20.r,
                        spreadRadius: 5.r,
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Top Image Area
                      Stack(
                        children: [
                          ClipRRect(
                            child: Image.asset(
                              movie.image,
                              height: 420.h,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          // Gradient overlay from bottom of image
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              height: 180.h,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.transparent,
                                    const Color(0xFF131313).withOpacity(0.9),
                                    const Color(0xFF131313),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          // Content on top of image gradient
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 20.h,
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  CustomText(
                                    text: '"${movie.title}"',
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFFFFFFFF),
                                    textAlign: TextAlign.center,
                                  ),
                                  SizedBox(height: 12.h),
                                  // Category Tags
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      _buildTag("Surrogate Bride"),
                                      SizedBox(width: 8.w),
                                      _buildTag("Taboo"),
                                    ],
                                  ),
                                  SizedBox(height: 20.h),
                                  // Play Button
                                  GestureDetector(
                                    onTap: () {
                                      onClose();
                                      // Get.toNamed(Routes.shortsScreen);////////////////////////
                                    },
                                    child: Container(
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(
                                        vertical: 10.h,
                                      ),
                                      decoration: BoxDecoration(
                                        color: const Color(0xFFE50914),
                                        borderRadius: BorderRadius.circular(
                                          8.r,
                                        ), // Sharper corners like picture
                                      ),
                                      alignment: Alignment.center,
                                      child: CustomText(
                                        text: "Play",
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Close Button (Top Right)
                Positioned(
                  top: -45.h, // Halfway outside
                  right: -12.w, // Halfway outside
                  child: GestureDetector(
                    onTap: onClose,
                    child: Container(
                      padding: EdgeInsets.all(4.r),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 4.r,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        Icons.close,
                        size: 18.sp,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(4.r),
        border: Border.all(color: Colors.white, width: 1.w),
      ),
      child: CustomText(
        text: text,
        fontSize: 12.sp,
        fontWeight: FontWeight.w700,
        color: Color(0xFFDBDBDB),
      ),
    );
  }
}
