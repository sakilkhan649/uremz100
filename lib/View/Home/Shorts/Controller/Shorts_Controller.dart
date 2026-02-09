import 'package:get/get.dart';

class ShortsController extends GetxController {
  var isFav = false.obs;
  void toggleFav() {
    isFav.value = !isFav.value;
  }
}
