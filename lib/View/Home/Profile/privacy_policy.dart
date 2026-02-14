import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uremz100/Utils/app_colors.dart';
import 'package:uremz100/Widgets/Custom_AppBar.dart';
import 'package:uremz100/Widgets/Custom_Text.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black100,
      appBar: const CustomAppBar(title: "Privacy Policy", showBackButton: true),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "🔐 Privacy Policy",
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(height: 20.h),
            _buildText("Effective Date: [Insert Date]"),
            _buildText(
              "Motly respects your privacy. By using our app, you agree to how we collect, use, and protect your data.",
            ),
            SizedBox(height: 16.h),
            _buildSectionHeader("What We Collect:"),
            _buildText("• Name, email, phone number, address"),
            _buildText("• Driver's license & booking details"),
            _buildText("• Payment and device info"),
            SizedBox(height: 16.h),
            _buildSectionHeader("How We Use It:"),
            _buildText("• To create your account"),
            _buildText("• To verify identity and complete bookings"),
            _buildText("• To process secure payments"),
            _buildText("• To send updates and support your experience"),
            SizedBox(height: 16.h),
            _buildSectionHeader("We Do Not:"),
            _buildText("• Sell your personal information"),
            _buildText(
              "• Share data without your consent (except with rental partners or as required by law)",
            ),
            SizedBox(height: 16.h),
            _buildSectionHeader("Your Rights:"),
            _buildText("• Access, edit, or delete your data"),
            _buildText("• Opt-out of marketing anytime"),
            SizedBox(height: 16.h),
            _buildText("All data is stored securely."),
            _buildText("📧 Questions? Contact us at: privacy@motlyapp.com"),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: CustomText(
        text: text,
        fontSize: 16.sp,
        fontWeight: FontWeight.w600,
      ),
    );
  }

  Widget _buildText(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: CustomText(
        text: text,
        fontSize: 14.sp,
        fontWeight: FontWeight.w400,
        color: AppColors.gray200,
      ),
    );
  }
}
