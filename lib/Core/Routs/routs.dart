import 'package:get/get.dart';
import 'package:uremz100/View/Home/Bottom_NabBar/Bottom_NabBar_Screens.dart';
import '../../View/Auth/Authentications_Screens/Forgot_OTP_Screen/forgot_OTP_Screen.dart';
import '../../View/Auth/Authentications_Screens/Forgot_Pass_Screen/forgot_Pass_Screen.dart';
import '../../View/Auth/Authentications_Screens/Set_Pass_Screen/set_Pass_Screen.dart';
import '../../View/Auth/Authentications_Screens/SignIn_Screen/signIn_Screen.dart';
import '../../View/Auth/Authentications_Screens/SignUp_Screen/signUp_Screen.dart';
import '../../View/Auth/Authentications_Screens/Signin_&_Signup_Screen/Signin_And_Signup_Screen.dart';
import '../../View/Auth/Welcome_Screen/welcome_Screen.dart';
import '../../View/Home/Discover/discover_screen.dart';
import '../../View/Home/Profile/Settings/settings_screen.dart';
import '../../View/Home/Profile/Change_password/change_password.dart';
import '../../View/Home/Profile/Change_profile_info/change_profile_info.dart';
import '../../View/Home/Profile/Privacy_Policy/privacy_policy.dart';
import '../../View/Home/Profile/User_agreement/user_agreement.dart';
import '../../View/Home/Subscribe/subscribe_screen.dart';

class Routes {
  static const String welcomeScreen = "/WelcomeScreen";
  static const String signinAndSignupScreen = "/SigninAndSignupScreen";
  static const String signinScreen = "/SigninScreen";
  static const String signupScreen = "/SignupScreen";
  static const String forgotPassScreen = "/ForgotPassScreen";
  static const String forgotOtpScreen = "/ForgotOtpScreen";
  static const String setPassScreen = "/SetPassScreen";
  static const String bottomNabbarScreens = "/BottomNabbarScreens";
  static const String discoverScreen = "/DiscoverScreen";
  static const String settingsScreen = "/SettingsScreen";
  static const String changeProfileInfo = "/change_profile_info";
  static const String changePassword = "/change_password";
  static const String privacyPolicy = "/privacy_policy";
  static const String userAgreement = "/user_agreement";
  static const String subscribeScreen = "/SubscribeScreen";

  static List<GetPage> routes = [
    GetPage(
      name: welcomeScreen,
      page: () => WelcomeScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: signinAndSignupScreen,
      page: () => SigninAndSignupScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: signinScreen,
      page: () => SigninScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: signupScreen,
      page: () => SignupScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: forgotPassScreen,
      page: () => ForgotPassScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: forgotOtpScreen,
      page: () => ForgotOtpScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: setPassScreen,
      page: () => SetPassScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: bottomNabbarScreens,
      page: () => BottomNabbarScreens(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: discoverScreen,
      page: () => DiscoverScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: settingsScreen,
      page: () => SettingsScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: changeProfileInfo,
      page: () => ChangeProfileInfoScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: changePassword,
      page: () => ChangePasswordScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: privacyPolicy,
      page: () => PrivacyPolicyScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: userAgreement,
      page: () => UserAgreementScreen(),
      transition: Transition.noTransition,
    ),
    GetPage(
      name: subscribeScreen,
      page: () => SubscribeScreen(),
      transition: Transition.noTransition,
    ),
  ];
}
