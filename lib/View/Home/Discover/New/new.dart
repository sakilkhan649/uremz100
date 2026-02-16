import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../Controller/discover_controller.dart';
import '../Widget/discrive_widget.dart';

class NewView extends StatelessWidget {
  final DiscoverController controller;
  const NewView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: "Coming Soon"),
        SizedBox(height: 12.h),
        MovieGrid(items: controller.allMovies.take(3).toList(), count: 3),
        SectionHeader(title: "New Release"),
        SizedBox(height: 12.h),
        MovieGrid(
          items: [...controller.allMovies, ...controller.allMovies],
          count: 3,
        ),
      ],
    );
  }
}
