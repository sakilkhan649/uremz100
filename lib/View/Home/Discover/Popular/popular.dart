import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Controller/discover_controller.dart';
import '../New/new.dart';
import '../Widget/discrive_widget.dart';

class PopularView extends StatelessWidget {
  final DiscoverController controller;
  const PopularView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 8.h),
        // First Row (Spider-Man, Crimson Chars, Glass)
        MovieGrid(items: controller.allMovies.sublist(0, 3), count: 3),
        SizedBox(height: 12.h),
        // Second Row (Spider-Man Brand, Crimson Chars, Spider-Man Brand)
        MovieGrid(items: controller.allMovies.sublist(3, 6), count: 3),

        SectionHeader(title: "Recently Watched"),
        SizedBox(height: 12.h),
        // Recently Watched
        MovieGrid(items: controller.allMovies.sublist(0, 2), count: 3),

        SectionHeader(title: "You Might Like"),
        SizedBox(height: 16.h),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Left Column: 2 Movies stacked
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  MovieCard(movie: controller.allMovies[1]), // Crimson Chars
                  SizedBox(height: 12.h),
                  MovieCard(movie: controller.allMovies[3]), // Spider-Man Brand
                ],
              ),
            ),
            SizedBox(width: 12.w),
            // Right Column: Top Picks Card
            Expanded(
              flex: 2,
              child: TopPicksList(
                movies: controller.allMovies.sublist(
                  7,
                  11,
                ), // Avatar to Avatar (4 items)
              ),
            ),
          ],
        ),

        SizedBox(height: 18.h),
        SectionHeader(title: "Most Popular Series"),
        SizedBox(height: 12.h),
        // Wednesday Chars, The Originals Most, Game Of Thrones
        MovieGrid(
          items: [
            controller.allMovies[4],
            controller.allMovies[5],
            controller.allMovies[6],
          ],
          count: 3,
        ),
      ],
    );
  }
}
