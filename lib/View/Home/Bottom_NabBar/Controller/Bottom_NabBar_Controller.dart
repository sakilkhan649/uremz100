import 'package:get/get.dart';

class NavigationController extends GetxController {
  var currentIndex = 0.obs;
  var showBottomNav = true.obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments is int) {
      currentIndex.value = Get.arguments;
    } else if (Get.arguments is Map &&
        Get.arguments.containsKey('bottomIndex')) {
      currentIndex.value = Get.arguments['bottomIndex'];
    }
  }

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  void toggleBottomNav(bool show) {
    showBottomNav.value = show;
  }
}