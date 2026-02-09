import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uremz100/Widgets/Custom_Text.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final bool hasViewAll;
  final VoidCallback? onViewAll;

  const SectionHeader({
    super.key,
    required this.title,
    this.hasViewAll = true,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: title,
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
          if (hasViewAll)
            GestureDetector(
              onTap: onViewAll,
              child: Icon(
                Icons.arrow_forward_ios,
                size: 16.sp,
                color: Colors.white.withOpacity(0.5),
              ),
            ),
        ],
      ),
    );
  }
}
