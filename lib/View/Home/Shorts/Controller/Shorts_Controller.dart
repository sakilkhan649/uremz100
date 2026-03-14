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
  var showEpisodePopup = false.obs;
  var selectedEpisodeRange = "1-25".obs;

  void toggleEpisodePopup() {
    showEpisodePopup.value = !showEpisodePopup.value;
  }

  void changeEpisodeRange(String range) {
    selectedEpisodeRange.value = range;
  }

  List<int> get episodesForSelectedRange {
    final range = selectedEpisodeRange.value;
    if (range == "1-25") {
      return List.generate(25, (i) => i + 1);
    } else if (range == "26-43") {
      return List.generate(18, (i) => i + 26);
    } else if (range == "44-93") {
      return List.generate(50, (i) => i + 44);
    }
    return [];
  }

  void selectEpisode(int episode) {
    currentEpisode.value = episode;
    showEpisodePopup.value = false;
  }

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
    if (isFav.value) {
      showLoginPopup.value = true;
    }
  }

  void toggleBookmark() {
    isBookmarked.value = !isBookmarked.value;
    if (isBookmarked.value) {
      showLoginPopup.value = true;
    }
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
