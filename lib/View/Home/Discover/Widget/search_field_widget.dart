import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchFieldWidget extends StatelessWidget {
  final String hintText;

  const SearchFieldWidget({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.h,
      decoration: BoxDecoration(
        color: const Color(0xFF1C1C1E),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.3),
            fontSize: 14.sp,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.white.withOpacity(0.3),
            size: 20.sp,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(vertical: 8.h),
        ),
      ),
    );
  }
}
