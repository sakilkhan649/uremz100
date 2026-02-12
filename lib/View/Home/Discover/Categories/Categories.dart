import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uremz100/View/Home/Discover/Controller/discover_controller.dart';
import 'package:uremz100/View/Home/Discover/Widget/movie_card.dart';

class CategoriesWidget extends StatelessWidget {
  const CategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DiscoverController>();

    return Column(
      children: [
        // Category Pills
        Container(
          height: 50,
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            scrollDirection: Axis.horizontal,
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              return Obx(() {
                final isSelected = controller.selectedCategory.value == index;
                return GestureDetector(
                  onTap: () => controller.changeCategory(index),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    margin: const EdgeInsets.only(right: 12),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.amber : Colors.grey[900],
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isSelected ? Colors.amber : Colors.white24,
                      ),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      controller.categories[index],
                      style: TextStyle(
                        color: isSelected ? Colors.black : Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              });
            },
          ),
        ),

        // Movie Grid
        Expanded(
          child: Obx(() {
            final movies = controller.getCategoryMovies(controller.selectedCategory.value);
            return GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, 
                childAspectRatio: 0.7,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return MovieCard(movie: movies[index]);
              },
            );
          }),
        ),
      ],
    );
  }
}
