import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../../../../Utils/app_icons.dart';
import '../Controller/Shorts_Video_Controller.dart';

class ShortsVideoPlayer extends StatefulWidget {
  final String videoUrl;
  const ShortsVideoPlayer({super.key, required this.videoUrl});

  @override
  State<ShortsVideoPlayer> createState() => _ShortsVideoPlayerState();
}

class _ShortsVideoPlayerState extends State<ShortsVideoPlayer> {
  late ShortsVideoController controller;

  @override
  void initState() {
    super.initState();
    controller =
        Get.put(ShortsVideoController(widget.videoUrl), tag: widget.videoUrl);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isError.value) {
        return const Center(
          child: Icon(Icons.error, color: Colors.white, size: 40),
        );
      }

      return controller.isInitialized.value
          ? GestureDetector(
        onTap: () => controller.togglePlayPause(),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned.fill(
              child: FittedBox(
                fit: BoxFit.cover,
                child: SizedBox(
                  width:
                  controller.videoPlayerController.value.size.width,
                  height:
                  controller.videoPlayerController.value.size.height,
                  child: VideoPlayer(controller.videoPlayerController),
                ),
              ),
            ),
            if (!controller.isPlaying.value)
              Container(
                width: 90.w,
                height: 90.w,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.45),
                  shape: BoxShape.circle,

                ),
                padding: EdgeInsets.all(28.r),
                child: SvgPicture.asset(
                  AppIcons.play_icon,
                  colorFilter: const ColorFilter.mode(
                    Colors.white,
                    BlendMode.srcIn,
                  ),
                ),
              ),
          ],
        ),
      )
          : const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      );
    });
  }
}
