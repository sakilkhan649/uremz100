import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uremz100/View/Home/Bottom_NabBar/Bottom_NabBar_Screens.dart';

import '../../../Utils/app_images.dart';
import '../Authentications_Screens/Signin_&_Signup_Screen/Signin_And_Signup_Screen.dart';
import '../Onboarding_Screen/onboarding_Screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => BottomNabbarScreens()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AppImages.app_logo, height: 145.h, width: 150.w),
      ),
    );
  }
}
