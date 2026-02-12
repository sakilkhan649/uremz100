import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uremz100/View/Home/Discover/Controller/discover_controller.dart';
import 'package:uremz100/View/Home/Discover/Widget/movie_card.dart';
import 'package:uremz100/View/Home/Discover/Widget/section_header.dart';

class PopularWidget extends StatelessWidget {
  const PopularWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DiscoverController>();

    return SingleChildScrollView(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Coming Soon
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SectionHeader(title: "Coming Soon"),
          ),
          SizedBox(
            height: 180,
            child: Obx(
              () => ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: controller.comingSoon.length,
                itemBuilder: (context, index) {
                  return MovieCard(movie: controller.comingSoon[index]);
                },
              ),
            ),
          ),

          // New Release
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SectionHeader(title: "New Release"),
          ),
          SizedBox(
            height: 180,
            child: Obx(
              () => ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: controller.newRelease.length,
                itemBuilder: (context, index) {
                  return MovieCard(movie: controller.newRelease[index]);
                },
              ),
            ),
          ),

          // Top VIP Picks
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SectionHeader(title: "Top VIP Picks", onMoreTap: () {}),
          ),
          SizedBox(
            height: 180,
            child: Obx(
              () => ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: controller.topVipPicks.length,
                itemBuilder: (context, index) {
                  return MovieCard(movie: controller.topVipPicks[index]);
                },
              ),
            ),
          ),

           // Only On ShortMax
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SectionHeader(title: "Only On ShortMax"),
          ),
          SizedBox(
            height: 180,
            child: Obx(
              () => ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: controller.onlyOnShortMax.length,
                itemBuilder: (context, index) {
                  return MovieCard(movie: controller.onlyOnShortMax[index]);
                },
              ),
            ),
          ),
           
           // Hot Now
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: SectionHeader(title: "Hot Now"),
          ),
          SizedBox(
            height: 180,
            child: Obx(
              () => ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: controller.hotNow.length,
                itemBuilder: (context, index) {
                  return MovieCard(movie: controller.hotNow[index]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
