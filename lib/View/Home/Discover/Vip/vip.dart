import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Controller/discover_controller.dart';
import '../Widget/discrive_widget.dart';

class VipView extends StatelessWidget {
  final DiscoverController controller;
  const VipView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: "Top VIP Picks", onMore: () {}),
        SizedBox(height: 12.h),
        Obx(
          () => Row(
            children: [
              _buildToggleButton("Daily"),
              SizedBox(width: 10.w),
              _buildToggleButton("Weekly"),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        MovieGrid(items: controller.allMovies.take(3).toList(), count: 3),
        SizedBox(height: 24.h),
        SectionHeader(title: "Only On ShortMax"),
        SizedBox(height: 12.h),
        MovieGrid(items: controller.allMovies.take(3).toList(), count: 3),
        SizedBox(height: 24.h),
        SectionHeader(title: "Hot Now"),
        SizedBox(height: 12.h),
        MovieGrid(items: controller.allMovies.take(3).toList(), count: 3),
        SizedBox(height: 24.h),
        MovieGrid(
          items: controller.allMovies.skip(3).take(3).toList(),
          count: 3,
        ),
      ],
    );
  }

  Widget _buildToggleButton(String label) {
    final isSelected = controller.vipPeriod.value == label;
    return GestureDetector(
      onTap: () => controller.changeVipPeriod(label),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: isSelected ? Colors.white : const Color(0xFF1A1A1A),
          borderRadius: BorderRadius.circular(6.r),
          border: Border.all(
            color: isSelected ? Colors.white : Colors.white.withOpacity(0.1),
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.inter(
            color: isSelected ? Colors.black : const Color(0xFF8E8E8E),
            fontSize: 12.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
