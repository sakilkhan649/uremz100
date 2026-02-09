import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchFieldWidget extends StatelessWidget {
  final String hintText;

  const SearchFieldWidget({super.key, required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1D1817),
        borderRadius: BorderRadius.circular(8.r),
        border: Border.all(color: Color(0xFFC5C5C5), width: 1),
      ),
      child: TextField(
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Color(0xFFC5C5C5), fontSize: 14.sp),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Color(0xFFC5C5C5), size: 24.sp),
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
            vertical: 10.h,
            horizontal: 10.w,
          ),
        ),
      ),
    );
  }
}
