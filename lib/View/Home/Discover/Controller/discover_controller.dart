import 'package:get/get.dart';
import '../Models/discrive_models.dart';
import '../Data/discover_data.dart';

class DiscoverController extends GetxController {
  var selectedCategory = 'Popular'.obs;
  var showBonusPopup = false.obs;

  final List<String> categories = DiscoverData.categories;
  final List<DiscoverMovie> allMovies = DiscoverData.allMovies;
  final List<BonusItem> dailyBonus = DiscoverData.dailyBonus;

  @override
  void onReady() {
    super.onReady();
    // Trigger popup on first load
    Future.delayed(const Duration(seconds: 1), () {
      showBonusPopup.value = true;
    });
  }

  void changeCategory(String category) {
    selectedCategory.value = category;
  }

  List<DiscoverMovie> get filteredMovies {
    if (selectedCategory.value == 'Popular') {
      return allMovies;
    }
    return allMovies
        .where((movie) => movie.categories.contains(selectedCategory.value))
        .toList();
  }

  void closePopup() {
    showBonusPopup.value = false;
  }
}
