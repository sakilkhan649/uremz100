import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uremz100/View/Home/Discover/Controller/discover_controller.dart';
import 'package:uremz100/View/Home/Discover/Widget/movie_card.dart';

class NewWidget extends StatelessWidget {
  const NewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DiscoverController>();

    return Obx(
      () => GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.7,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: controller.newRelease.length,
        itemBuilder: (context, index) {
          return MovieCard(movie: controller.newRelease[index]);
        },
      ),
    );
  }
}
