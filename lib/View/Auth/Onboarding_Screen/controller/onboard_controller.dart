import 'dart:ui';
import 'package:get/get.dart';
import '../../../../Utils/app_images.dart';
import '../model/onboard_models.dart';

class OnboardingController extends GetxController {
  var selectedPageIndex = 0.obs;

  List<OnboardingInfo> onboardingpage = [
    OnboardingInfo(
      AppImages.on_image_one,
      "Unlimited offer of movies, series & programs",
      "Watch anytime, anywhere . Cancel your subscription any time at no extra cost",
      Color(0xFF1C1C1C), // Gradient start color
      Color(0xFF000000), // Gradient end color - Black
    ),
    OnboardingInfo(
      AppImages.on_image_two,
      "Episodic movies in vertical format",
      "Vertical episodic movies built for comfort, clarity, and mobile-first entertainment",
      Color(0xFF6F614E), // Gradient start color - Brown
      Color(0xFF000000), // Gradient end color - Black
    ),
    OnboardingInfo(
      AppImages.on_image_three,
      "Subscribe & watch unlimited content",
      "Affordable plans starting at \$2.99. Join and start streaming now.",
      Color(0xFF262922), // Gradient start color - Dark green
      Color(0xFF000000), // Gradient end color - Black
    ),
  ];
}
