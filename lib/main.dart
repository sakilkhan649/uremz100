import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'Core/Routs/routs.dart';
import 'Utils/app_colors.dart';
import 'Widgets/pip_wrapper.dart';

void main() async{
  // Ensure Flutter is initialized
  WidgetsFlutterBinding.ensureInitialized();
  
  // // Initialize Firebase
  // await Firebase.initializeApp();
  //
  // // Initialize Firebase Messaging
  // await FirebaseNotificationService.initialize();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      child: GetMaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: AppColors.black100),
        debugShowCheckedModeBanner: false,
        getPages: Routes.routes,
        initialRoute: Routes.welcomeScreen,
        builder: (context, child) {
          return child != null ? PipWrapper(child: child) : const SizedBox.shrink();
        },
      ),
    );
  }
}
