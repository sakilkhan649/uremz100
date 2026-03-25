import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class ShortsVideoController extends GetxController {
  final String videoUrl;
  late VideoPlayerController videoPlayerController;

  var isInitialized = false.obs;
  var isPlaying = false.obs;
  var isError = false.obs;

  ShortsVideoController(this.videoUrl);

  @override
  void onInit() {
    super.onInit();
    _initialize();
  }

  void _initialize() {
    videoPlayerController = VideoPlayerController.networkUrl(Uri.parse(videoUrl))
      ..initialize().then((_) async {
        if (!isClosed) {
          isInitialized.value = true;
          // Wait for 1 second as requested by user before auto-playing
          await Future.delayed(const Duration(milliseconds: 500));
          if (!isClosed) {
            videoPlayerController.play();
            videoPlayerController.setLooping(true);
            isPlaying.value = true;
          }
        }
      }).catchError((error) {
        isError.value = true;
      });
  }

  void togglePlayPause() {
    if (videoPlayerController.value.isPlaying) {
      videoPlayerController.pause();
      isPlaying.value = false;
    } else {
      videoPlayerController.play();
      isPlaying.value = true;
    }
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    super.onClose();
  }
}
