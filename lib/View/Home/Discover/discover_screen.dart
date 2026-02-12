import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:uremz100/View/Home/Discover/Controller/discover_controller.dart';
import 'package:uremz100/View/Home/Discover/Popular/Popular.dart';
import 'package:uremz100/View/Home/Discover/New/New.dart';
import 'package:uremz100/View/Home/Discover/VIP/VIP.dart';
import 'package:uremz100/View/Home/Discover/TopPicks/TopPicks.dart';
import 'package:uremz100/View/Home/Discover/Ranking/Ranking.dart';
import 'package:uremz100/View/Home/Discover/Categories/Categories.dart';
import 'package:uremz100/Utils/app_images.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize Controller
    final controller = Get.put(DiscoverController());

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             // Search Bar & VIP Icon
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const TextField(
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: "Action movies",
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // VIP Crown Icon (Custom Widget or Image)
                  Container(
                     padding: const EdgeInsets.all(8),
                     decoration: const BoxDecoration(
                       shape: BoxShape.circle,
                       color: Colors.transparent // Or a background if needed
                     ),
                     child: const Icon(Icons.whatshot, color: Colors.amber, size: 28), // Placeholder for VIP Icon
                  )
                ],
              ),
            ),

            // Top Tabs (Popular, New, VIP, etc.)
            Container(
              height: 40,
              margin: const EdgeInsets.only(bottom: 10),
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.horizontal,
                itemCount: controller.mainTabs.length,
                itemBuilder: (context, index) {
                  return Obx(() {
                    final isSelected = controller.selectedTab.value == index;
                    return GestureDetector(
                      onTap: () => controller.changeTab(index),
                      child: Container(
                        margin: const EdgeInsets.only(right: 20),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: isSelected
                              ? const Border(
                                  bottom: BorderSide(color: Colors.deepOrange, width: 2),
                                )
                              : null,
                        ),
                        child: Text(
                          controller.mainTabs[index],
                          style: TextStyle(
                            color: isSelected ? Colors.white : Colors.grey,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    );
                  });
                },
              ),
            ),

            // Main Content Area
            Expanded(
              child: Obx(() {
                 switch (controller.selectedTab.value) {
                   case 0:
                     return const PopularWidget();
                   case 1:
                     return const NewWidget();
                   case 2:
                     return const VIPWidget();
                   case 3:
                     return const TopPicksWidget();
                   case 4:
                     return const RankingWidget();
                   case 5:
                     return const CategoriesWidget();
                   default:
                     return const Center(child: Text("Coming Soon", style: TextStyle(color: Colors.white)));
                 }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
