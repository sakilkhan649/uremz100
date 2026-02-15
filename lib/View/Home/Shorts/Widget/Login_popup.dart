import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uremz100/Utils/app_icons.dart';
import '../../../../Utils/app_colors.dart';
import '../../../../Widgets/Custom_Text.dart';

class LoginPopup extends StatelessWidget {
  final VoidCallback onSignIn;
  final VoidCallback onClose;

  LoginPopup({super.key, required this.onSignIn, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.all(24.r),
        margin: EdgeInsets.symmetric(horizontal: 40.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10.r,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Close Button
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: onClose,
                child: Icon(Icons.close, size: 24.w, color: Colors.black),
              ),
            ),

            // Megaphone Icon (Mocked for now)
            SvgPicture.asset(AppIcons.alarm_icon, height: 60.w, width: 60.w),
            SizedBox(height: 14.h),

            // Text Content
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
                children: [
                  const TextSpan(text: "To "),
                  TextSpan(
                    text: "Protect your property,",
                    style: TextStyle(color: AppColors.orange100),
                  ),
                  const TextSpan(
                    text:
                        "\nPlease log in to your account\nto avoid loss of information!",
                  ),
                ],
              ),
            ),

            SizedBox(height: 28.h),

            // Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: onSignIn,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orange100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10.h),
                ),
                child: CustomText(
                  text: "Sign In",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
