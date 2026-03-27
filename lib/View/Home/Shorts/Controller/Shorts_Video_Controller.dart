import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class ShortsVideoController extends GetxController {
  final String videoUrl;
  late VideoPlayerController videoPlayerController;

  var isInitialized = false.obs;
  var isPlaying = false.obs;
  var isError = false.obs;
  var position = Duration.zero.obs;
  var duration = Duration.zero.obs;
  var playbackSpeed = 1.0.obs;
  var showPlayButton = true.obs;

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
          duration.value = videoPlayerController.value.duration;
          
          videoPlayerController.addListener(() {
            if (videoPlayerController.value.isInitialized) {
              position.value = videoPlayerController.value.position;
            }
          });

          // Wait for 500ms as requested by user before auto-playing
          await Future.delayed(const Duration(milliseconds: 500));
          if (!isClosed) {
            videoPlayerController.play();
            videoPlayerController.setLooping(true);
            isPlaying.value = true;
            _startPlayButtonTimer();
          }
        }
      }).catchError((error) {
        isError.value = true;
      });
  }

  void _startPlayButtonTimer() {
    showPlayButton.value = true;
    Future.delayed(const Duration(milliseconds: 500), () {
      if (isPlaying.value && !isClosed) {
        showPlayButton.value = false;
      }
    });
  }

  void togglePlayPause() {
    if (videoPlayerController.value.isPlaying) {
      pauseVideo();
    } else {
      videoPlayerController.play();
      isPlaying.value = true;
      _startPlayButtonTimer(); // Hide after 500ms when playing
    }
  }

  void pauseVideo() {
    if (videoPlayerController.value.isInitialized &&
        videoPlayerController.value.isPlaying) {
      videoPlayerController.pause();
      isPlaying.value = false;
      showPlayButton.value = true; // Show immediately when paused
    }
  }

  void seekTo(Duration pos) {
    videoPlayerController.seekTo(pos);
    position.value = pos;
  }

  void setPlaybackSpeed(double speed) {
    videoPlayerController.setPlaybackSpeed(speed);
    playbackSpeed.value = speed;
  }

  @override
  void onClose() {
    pauseVideo();
    videoPlayerController.dispose();
    super.onClose();
  }
}
