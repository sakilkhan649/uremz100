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

class ForgotPassScreen extends StatelessWidget {
  ForgotPassScreen({super.key});

  TextEditingController emailController = TextEditingController();

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
                  AppImages.forgot_image,
                  height: 250.w,
                  width: 250.w,
                ),
              ),
              SizedBox(height: 24.h),
              Align(
                alignment: Alignment.center,
                child: CustomText(
                  text: "Forgot Your Password?",
                  fontSize: 22.sp,
                  fontWeight: FontWeight.w700,
                  color: AppColors.white100,
                ),
              ),
              SizedBox(height: 4.h),
              Align(
                alignment: Alignment.center,
                child: CustomText(
                  text: "Enter your registered email address to receive a one-",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.gray300,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: CustomText(
                  text: "time password (OTP) and securely reset your",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.gray300,
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: CustomText(
                  text: "password.",
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  color: AppColors.gray300,
                ),
              ),

              SizedBox(height: 50.h),
              // Email Field
              CustomTextgray(
                text: "Email",
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              SizedBox(height: 8.h),
              Customtextfield(
                controller: emailController,
                hintText: "mdibukholil@gmail.com",
                obscureText: false,
                textInputType: TextInputType.emailAddress,
              ),
              SizedBox(height: 20.h),
              // Send OTP Button
              CustomButton(
                text: "Send OTP",
                onPressed: () {
                  Get.toNamed(Routes.forgotOtpScreen);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
