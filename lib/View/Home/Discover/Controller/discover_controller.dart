import 'package:get/get.dart';
import '../Models/discrive_models.dart';
import '../Data/discover_data.dart';

class DiscoverController extends GetxController {
  var selectedCategory = 'Popular'.obs;
  var showBonusPopup = false.obs;
  var vipPeriod = 'Daily'.obs;
  var selectedRankingTab = 'Popular'.obs;

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

  void changeVipPeriod(String period) {
    vipPeriod.value = period;
  }

  List<DiscoverMovie> get vipMovies {
    final period = vipPeriod.value;
    if (period == 'Daily') {
      return allMovies.take(6).toList();
    } else if (period == 'Weekly') {
      return allMovies.skip(3).take(6).toList();
    }
    return allMovies.take(6).toList();
  }

  void changeRankingTab(String tab) {
    selectedRankingTab.value = tab;
  }

  List<DiscoverMovie> get filteredMovies {
    if (selectedCategory.value == 'Popular') {
      return allMovies;
    }
    return allMovies
        .where((movie) => movie.categories.contains(selectedCategory.value))
        .toList();
  }

  List<DiscoverMovie> get rankingMovies {
    // selectedRankingTab.value অ্যাক্সেস করার মাধ্যমে এই গেটারটিকে রিঅ্যাক্টিভ করা হয়েছে
    // যাতে ইউজার যখনই ট্যাবে ক্লিক করবে, তখনই ডাটা আপডেট হয়।
    final tab = selectedRankingTab.value;

    // মডেল থেকে সব ডাটা নিয়ে আসা হচ্ছে।
    // এখানে আপনি প্রতিটি ক্যাটাগরির জন্য আলাদা ফিল্টারিং লজিক দিতে পারেন।
    if (tab == 'Popular') {
      // Popular ক্যাটাগরির মুভিগুলো রিটার্ন করা হচ্ছে
      return allMovies.where((m) => m.categories.contains('Popular')).toList();
    } else if (tab == 'Daily Top') {
      // Daily Top ক্যাটাগরির মুভিগুলো ফিল্টার করে আনা হচ্ছে
      return allMovies
          .where(
            (m) => m.categories.contains('Daily Top') || m.views.contains('M'),
          )
          .toList();
    } else if (tab == 'Weekly Top') {
      // Weekly Top এর জন্য ডাটা ফিল্টার করা হচ্ছে
      return allMovies
          .where((m) => m.categories.contains('Weekly Top') || m.isVip)
          .toList();
    } else if (tab == 'Monthly Top') {
      // Monthly Top এর জন্য মডেল থেকে ডাটা ফিল্টার করা হচ্ছে
      return allMovies
          .where((m) => m.categories.contains('Monthly Top') || m.badge != null)
          .toList();
    }

    // ডিফল্টভাবে সব মুভি দেখানো হচ্ছে যদি কোনো কন্ডিশন না মিলে
    return allMovies;
  }

  void closePopup() {
    showBonusPopup.value = false;
  }
}
