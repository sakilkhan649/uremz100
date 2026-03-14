import 'package:get/get.dart';

class ShortsController extends GetxController {
  var isFav = false.obs;
  var isBookmarked = true.obs;
  var showLoginPopup = false.obs;
  var showMoreMenu = false.obs;
  var currentEpisode = 4.obs;
  var currentSeason = 2.obs;
  var isPipEnabled = true.obs;
  var playbackSpeed = "1.0x".obs;
  var videoQuality = "1080p".obs;
  var isDescriptionExpanded = false.obs;

  void toggleDescription() {
    isDescriptionExpanded.value = !isDescriptionExpanded.value;
  }

  void updatePlaybackSpeed(String speed) {
    playbackSpeed.value = speed;
  }

  void updateVideoQuality(String quality) {
    videoQuality.value = quality;
  }

  void toggleFav() {
    isFav.value = !isFav.value;
  }

  void toggleBookmark() {
    isBookmarked.value = !isBookmarked.value;
  }

  void toggleLoginPopup() {
    showLoginPopup.value = !showLoginPopup.value;
  }

  void toggleMoreMenu() {
    showMoreMenu.value = !showMoreMenu.value;
  }

  void togglePip() {
    isPipEnabled.value = !isPipEnabled.value;
  }
}
