import 'package:get/get.dart';
import 'package:uremz100/Utils/app_images.dart';

class MovieItem {
  final String id;
  final String title;
  final String subtitle;
  final String image;
  final String? badge;
  final String views;

  MovieItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.image,
    this.badge,
    required this.views,
  });
}

class MyListController extends GetxController {
  final recentlyWatched = <MovieItem>[
    MovieItem(
      id: '1',
      title: 'Spider-Man',
      subtitle: 'Hiden Identity',
      image: AppImages.move_1,
      badge: 'Exclusive',
      views: '12.1M',
    ),
    MovieItem(
      id: '2',
      title: 'Crimson Chars',
      subtitle: 'Revenge',
      image: AppImages.move_2,
      badge: 'Exclusive',
      views: '3.1M',
    ),
    MovieItem(
      id: '3',
      title: 'Glass In Cinemas',
      subtitle: 'Age Gap',
      image: AppImages.move_3,
      views: '12.1M',
    ),
  ].obs;

  final myCollection = <MovieItem>[
    MovieItem(
      id: '4',
      title: 'Sicario',
      subtitle: 'Hiden Identity',
      image: AppImages.move_4,
      badge: 'New',
      views: '12.1M',
    ),
    MovieItem(
      id: '5',
      title: 'Crimson Chars',
      subtitle: 'Age Gap',
      image: AppImages.move_5,
      badge: 'New',
      views: '3.1M',
    ),
    MovieItem(
      id: '6',
      title: 'Spider-Man Brand',
      subtitle: 'New Day',
      image: AppImages.move_6,
      badge: 'New',
      views: '12.1M',
    ),
    MovieItem(
      id: '7',
      title: 'Crimson Chars',
      subtitle: 'Age Gap',
      image: AppImages.move_1,
      views: '12.1M',
    ),
    MovieItem(
      id: '8',
      title: 'Crimson Chars',
      subtitle: 'Age Gap',
      image: AppImages.move_2,
      views: '3.1M',
    ),
    MovieItem(
      id: '9',
      title: 'Spider-Man Brand',
      subtitle: 'New Day',
      image: AppImages.move_3,
      views: '12.1M',
    ),
    MovieItem(
      id: '10',
      title: 'Crimson Chars',
      subtitle: 'Exclusive',
      image: AppImages.move_4,
      badge: 'VIP',
      views: '3.1M',
    ),
    MovieItem(
      id: '11',
      title: 'Crimson Chars',
      subtitle: 'Revenge',
      image: AppImages.move_5,
      badge: 'VIP',
      views: '5.1M',
    ),
    MovieItem(
      id: '12',
      title: 'Mega',
      subtitle: 'New Day',
      image: AppImages.move_6,
      badge: 'VIP',
      views: '12.1M',
    ),
  ].obs;

  final isSelectionMode = false.obs;
  final selectedItems = <String>{}.obs;

  void toggleSelectionMode() {
    isSelectionMode.value = !isSelectionMode.value;
    if (!isSelectionMode.value) {
      selectedItems.clear();
    }
  }

  void toggleItemSelected(String id) {
    if (selectedItems.contains(id)) {
      selectedItems.remove(id);
    } else {
      selectedItems.add(id);
    }
  }

  void selectAll() {
    final allIds = [
      ...recentlyWatched,
      ...myCollection,
    ].map((e) => e.id).toSet();
    if (selectedItems.length == allIds.length) {
      selectedItems.clear();
    } else {
      selectedItems.addAll(allIds);
    }
  }

  void removeSelected() {
    recentlyWatched.removeWhere((item) => selectedItems.contains(item.id));
    myCollection.removeWhere((item) => selectedItems.contains(item.id));
    selectedItems.clear();
    isSelectionMode.value = false;
  }
}
