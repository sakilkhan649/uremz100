import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:uremz100/Utils/app_colors.dart';
import 'package:uremz100/Utils/app_images.dart';
import 'package:uremz100/Widgets/Custom_AppBar.dart';
import 'package:uremz100/Widgets/Custom_Text.dart';
import 'package:uremz100/Widgets/Custom_Text_Field.dart';

class ChangeProfileInfoScreen extends StatefulWidget {
  const ChangeProfileInfoScreen({super.key});

  @override
  State<ChangeProfileInfoScreen> createState() =>
      _ChangeProfileInfoScreenState();
}

class _ChangeProfileInfoScreenState extends State<ChangeProfileInfoScreen> {
  final _nameController = TextEditingController(text: "Md Ibrahim Khalil");
  final _emailController = TextEditingController(text: "ibrahim@example.com");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black100,
      appBar: const CustomAppBar(
        title: "Change Profile Information",
        showBackButton: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 32.h),
            // Profile Image Edit
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 60.r,
                    backgroundImage: const AssetImage(AppImages.profile_image),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 4.w,
                    child: Container(
                      padding: EdgeInsets.all(4.w),
                      decoration: const BoxDecoration(
                        color: AppColors.orange100,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                        size: 20.sp,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32.h),

            // Name Field
            _buildLabel("Name"),
            SizedBox(height: 8.h),
            Customtextfield(
              controller: _nameController,
              hintText: "Enter your Full Name",
              obscureText: false,
              textInputType: TextInputType.name,
            ),
            SizedBox(height: 20.h),

            // Email Field
            _buildLabel("Email"),
            SizedBox(height: 8.h),
            Customtextfield(
              controller: _emailController,
              hintText: "Enter your email",
              obscureText: false,
              textInputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 20.h),

            // Gender Selector
            _buildLabel("Select Gender"),
            SizedBox(height: 8.h),
            _buildDropdown("Male"),
            SizedBox(height: 20.h),

            // Date of Birth
            _buildLabel("Date of Birth"),
            SizedBox(height: 8.h),
            _buildDropdown("DD.MM.YY"),

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

  Widget _buildDropdown(String hint) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: const Color(0xFFEFF6FF),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomText(
            text: hint,
            fontSize: 14.sp,
            color: AppColors.gray200,
            fontWeight: FontWeight.w400,
          ),
          Icon(
            Icons.keyboard_arrow_down,
            color: AppColors.gray200,
            size: 24.sp,
          ),
        ],
      ),
    );
  }
}
