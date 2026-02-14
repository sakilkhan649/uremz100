import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:uremz100/Utils/app_colors.dart';
import 'package:uremz100/Widgets/Custom_AppBar.dart';
import 'package:uremz100/Widgets/Custom_Text.dart';
import 'package:uremz100/Widgets/Custom_Text_Field.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black100,
      appBar: const CustomAppBar(
        title: "Change Password",
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24.h),
            CustomText(
              text: "Change Password",
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.gray200,
            ),
            SizedBox(height: 32.h),

            // Old Password
            _buildLabel("Old Password"),
            SizedBox(height: 8.h),
            Customtextfield(
              controller: _oldPasswordController,
              hintText: "Enter Old Password",
              obscureText: true,
              textInputType: TextInputType.visiblePassword,
            ),
            SizedBox(height: 20.h),

            // New Password
            _buildLabel("New Password"),
            SizedBox(height: 8.h),
            Customtextfield(
              controller: _newPasswordController,
              hintText: "Enter New Password",
              obscureText: true,
              textInputType: TextInputType.visiblePassword,
            ),
            SizedBox(height: 20.h),

            // Confirm Password
            _buildLabel("Confirm Password"),
            SizedBox(height: 8.h),
            Customtextfield(
              controller: _confirmPasswordController,
              hintText: "Enter Confirm Password",
              obscureText: true,
              textInputType: TextInputType.visiblePassword,
            ),

            SizedBox(height: 48.h),

            // Buttons
            Container(
              width: double.infinity,
              height: 50.h,
              child: ElevatedButton(
                onPressed: () => Get.back(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.orange100,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: CustomText(
                  text: "Save",
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Container(
              width: double.infinity,
              height: 50.h,
              child: OutlinedButton(
                onPressed: () => Get.back(),
                style: OutlinedButton.styleFrom(
                  side: BorderSide.none,
                  backgroundColor: AppColors.gray100.withOpacity(0.1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: const CustomText(
                  text: "Cancel",
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }

  Widget _buildLabel(String text) {
    return CustomText(text: text, fontSize: 16.sp, fontWeight: FontWeight.w600);
  }
}
