import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import '../../View/Auth/Authentications_Screens/Forgot_OTP_Screen/forgot_OTP_Screen.dart';
import '../../View/Auth/Authentications_Screens/Forgot_Pass_Screen/forgot_Pass_Screen.dart';
import '../../View/Auth/Authentications_Screens/Set_Pass_Screen/set_Pass_Screen.dart';
import '../../View/Auth/Authentications_Screens/SignIn_Screen/signIn_Screen.dart';
import '../../View/Auth/Authentications_Screens/SignUp_Screen/signUp_Screen.dart';
import '../../View/Auth/Authentications_Screens/Signin_&_Signup_Screen/Signin_And_Signup_Screen.dart';
import '../../View/Auth/Welcome_Screen/welcome_Screen.dart';

class Routes {
  static const String welcomeScreen = "/WelcomeScreen";
  static const String signinAndSignupScreen = "/SigninAndSignupScreen";
  static const String signinScreen = "/SigninScreen";
  static const String signupScreen = "/SignupScreen";
  static const String forgotPassScreen = "/ForgotPassScreen";
  static const String forgotOtpScreen = "/ForgotOtpScreen";
  static const String setPassScreen = "/SetPassScreen";

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
  ];
}
