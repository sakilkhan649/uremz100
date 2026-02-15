import 'package:get/get.dart';

class ShortsController extends GetxController {
  var isFav = false.obs;
  var showLoginPopup = false.obs;

  void toggleFav() {
    isFav.value = !isFav.value;
  }

  void toggleLoginPopup() {
    showLoginPopup.value = !showLoginPopup.value;
  }
}
