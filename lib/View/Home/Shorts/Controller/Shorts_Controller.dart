import 'package:get/get.dart';
import '../Model/shorts_model.dart';
import '../../../../Utils/app_images.dart';

class ShortsController extends GetxController {
  var shortsList = <ShortsModel>[].obs;
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

  @override
  void onInit() {
    super.onInit();
    shortsList.addAll([
      ShortsModel(
        videoUrl:
            "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4",
        title: "Big Buck Bunny",
        description:
            "A large rabbit helps his friends and learns about the power of friendship in a lush forest.",
        profileImage: AppImages.profile_image,
        episode: "1",
        season: "1",
      ),
      ShortsModel(
        videoUrl:
            "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4",
        title: "Elephants Dream",
        description:
            "A surreal journey through a mechanical world filled with curious characters and wonders.",
        profileImage: AppImages.profile_image,
        episode: "2",
        season: "1",
      ),
      ShortsModel(
        videoUrl:
            "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
        title: "For Bigger Blazes",
        description:
            "Action-packed stunts and fire-breathing performances that will leave you breathless.",
        profileImage: AppImages.profile_image,
        episode: "3",
        season: "1",
      ),
      ShortsModel(
        videoUrl:
            "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4",
        title: "For Bigger Escapes",
        description:
            "Thrill-seekers take on impossible challenges to escape from high-stakes situations.",
        profileImage: AppImages.profile_image,
        episode: "4",
        season: "1",
      ),
      ShortsModel(
        videoUrl:
            "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4",
        title: "For Bigger Fun",
        description:
            "A lighthearted comedy about a group of friends who find humor in life's most unexpected moments.",
        profileImage: AppImages.profile_image,
        episode: "5",
        season: "1",
      ),
    ]);
  }

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
