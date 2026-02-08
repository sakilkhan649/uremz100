import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:uremz100/Core/Routs/routs.dart';
import 'package:uremz100/Utils/app_colors.dart';
import 'package:uremz100/Widgets/Custom_Text.dart';
import '../../../../Utils/app_images.dart';
import '../../../../Widgets/Custom_AppBar.dart';
import '../../../../Widgets/Custom_Button.dart';
import '../../../../Widgets/Custom_Text_Field.dart';
import '../../../../Widgets/Custom_Text_Gray.dart';

class SetPassScreen extends StatelessWidget {
  SetPassScreen({super.key});

  TextEditingController NewPasswordController = TextEditingController();
  TextEditingController ConfromPasswordController = TextEditingController();

  // Reactive variable to control password visibility
  final isConformPasswordVisible = false.obs;
  final isNewPasswordVisible = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Center(
                child: Image.asset(
                  AppImages.sent_otp_image,
                  height: 250.w,
                  width: 250.w,
                ),
              ),
              SizedBox(height: 24.h),
              Align(
                alignment: Alignment.center,
                child: CustomText(
                  text: "Set Your New Password",
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white100,
                ),
              ),
              SizedBox(height: 4.h),
              Align(
                alignment: Alignment.center,
                child: CustomText(
                  text: "Create a strong password for your account. Make sure",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.gray300,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: CustomText(
                  text: "it’s something easy for you to remember, but hard for",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.gray300,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: CustomText(
                  text: "others to guess.",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.gray300,
                ),
              ),

              SizedBox(height: 50.h),
              // New Password Field
              CustomTextgray(
                text: "New Password",
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 8.h),
              Obx(
                () => Customtextfield(
                  controller: NewPasswordController,
                  hintText: "Enter your new password",
                  obscureText: !isNewPasswordVisible.value,
                  textInputType: TextInputType.visiblePassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      isNewPasswordVisible.value
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: AppColors.gray200,
                    ),
                    onPressed: () {
                      isNewPasswordVisible.value =
                          !isNewPasswordVisible.value; // Toggle visibility
                    },
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              // Confirm Password
              CustomTextgray(
                text: "Confirm Password",
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 8.h),
              Obx(
                () => Customtextfield(
                  controller: ConfromPasswordController,
                  hintText: "Re-enter your new password",
                  obscureText: !isConformPasswordVisible.value,
                  textInputType: TextInputType.visiblePassword,
                  suffixIcon: IconButton(
                    icon: Icon(
                      isConformPasswordVisible.value
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: AppColors.gray200,
                    ),
                    onPressed: () {
                      isConformPasswordVisible.value =
                          !isConformPasswordVisible.value; // Toggle visibility
                    },
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              // Send OTP Button
              CustomButton(
                text: "Reset Password",
                onPressed: () {
                 // Get.toNamed(Routes.forgotOtpScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
