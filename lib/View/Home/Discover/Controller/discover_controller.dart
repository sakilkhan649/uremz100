import 'package:get/get.dart';
import '../Model/discover_model.dart';
import 'package:uremz100/Utils/app_images.dart';

class DiscoverController extends GetxController {
  final RxInt selectedTab = 0.obs;
  final RxInt selectedRankingTab = 0.obs;
  final RxInt selectedVipFilter = 0.obs;

  final List<String> mainTabs = [
    "Popular",
    "New",
    "VIP",
    "Top Picks",
    "Ranking",
    "Categories",
  ];
  final List<String> rankingTabs = ["Popular", "Monthly Top", "Annual Top"];
  final List<String> categories = ["Action", "Drama", "Sci-Fi", "Comedy"];
  final RxInt selectedCategory = 0.obs;

  // Mock data for different sections
  final RxList<MovieModel> comingSoon = <MovieModel>[
    MovieModel(
      title: "Spider-Man Brand New Day",
      imageUrl: AppImages.move_1,
      views: "9.5M",
    ),
    MovieModel(
      title: "Crimson Chars Exclusive",
      imageUrl: AppImages.move_6,
      badge: "Exclusive",
      views: "3.1M",
    ),
    MovieModel(
      title: "Glass In Cinemas January 1st",
      imageUrl: AppImages.move_2,
      views: "12.1M",
    ),
    MovieModel(
      title: "Spider-Man Brand New Day",
      imageUrl: AppImages.move_3,
    ),
    MovieModel(
      title: "Crimson Chars Exclusive",
      imageUrl: AppImages.move_4,
    ),
    MovieModel(
      title: "Spider-Man Brand New Day",
      imageUrl: AppImages.move_5,
      badge: "New",
      views: "7.2M",
    ),
  ].obs;

  final RxList<MovieModel> newRelease = <MovieModel>[
    MovieModel(
      title: "Joker",
      imageUrl: AppImages.rewards_image,
      badge: "New",
      views: "25.1k",
    ),
    MovieModel(
      title: "Crimson Chars Exclusive",
      imageUrl: AppImages.rewards_image,
      badge: "New",
      views: "3.1M",
    ),
    MovieModel(
      title: "Sicario",
      imageUrl: AppImages.rewards_image,
      badge: "New",
      views: "12.1M",
    ),
  ].obs;

  final RxList<MovieModel> topVipPicks = <MovieModel>[
    MovieModel(
      title: "Crimson Chars Exclusive",
      imageUrl: AppImages.rewards_image,
      isVip: true,
      views: "3.1M",
    ),
    MovieModel(
      title: "Crimson Chars Revenge",
      imageUrl: AppImages.rewards_image,
      isVip: true,
      views: "3.1M",
    ),
    MovieModel(
      title: "Mega New Day",
      imageUrl: AppImages.rewards_image,
      isVip: true,
      views: "12.5M",
    ),
  ].obs;

  final RxList<MovieModel> onlyOnShortMax = <MovieModel>[
    MovieModel(
      title: "Crimson Chars Age Gap",
      imageUrl: AppImages.rewards_image,
      views: "3.1M",
    ),
    MovieModel(
      title: "Game Of Thrones",
      imageUrl: AppImages.rewards_image,
      views: "2.3M",
    ),
    MovieModel(
      title: "Spider-Man Brand New Day",
      imageUrl: AppImages.rewards_image,
      views: "12.1M",
    ),
  ].obs;

  final RxList<MovieModel> hotNow = <MovieModel>[
    MovieModel(
      title: "Crimson Chars Age Gap",
      imageUrl: AppImages.rewards_image,
      views: "3.1M",
      isVip: true,
    ),
    MovieModel(
      title: "Spider-Man Brand New Day",
      imageUrl: AppImages.rewards_image,
      views: "12.1M",
      badge: "New",
    ),
    MovieModel(
      title: "Legacies",
      imageUrl: AppImages.rewards_image,
      views: "1.2M",
      badge: "New",
    ),
  ].obs;

  final RxList<MovieModel> rankingMovies = <MovieModel>[
    MovieModel(
      rank: 1,
      title: "Lycan Princess Won't Be Your",
      imageUrl: AppImages.rewards_image,
      views: "127k",
      description:
          "An intense journey where danger, courage, and survival collide in a high-stakes battle.",
    ),
    MovieModel(
      rank: 2,
      title: "Lycan Princess Won't Be Your",
      imageUrl: AppImages.rewards_image,
      views: "227k",
      description:
          "An intense journey where danger, courage, and survival collide in a high-stakes battle.",
    ),
    MovieModel(
      rank: 3,
      title: "Lycan Princess Won't Be Your",
      imageUrl: AppImages.rewards_image,
      views: "327k",
      description:
          "An intense journey where danger, courage, and survival collide in a high-stakes battle.",
    ),
    MovieModel(
      rank: 4,
      title: "Lycan Princess Won't Be Your",
      imageUrl: AppImages.rewards_image,
      views: "427k",
      description:
          "An intense journey where danger, courage, and survival collide in a high-stakes battle.",
    ),
    MovieModel(
      rank: 5,
      title: "Lycan Princess Won't Be Your",
      imageUrl: AppImages.rewards_image,
      views: "127k",
      description:
          "An intense journey where danger, courage, and survival collide in a high-stakes battle.",
    ),
    MovieModel(
      rank: 6,
      title: "Lycan Princess Won't Be Your",
      imageUrl: AppImages.rewards_image,
      views: "307k",
      description:
          "An intense journey where danger, courage, and survival collide in a high-stakes battle.",
    ),
    MovieModel(
      rank: 7,
      title: "Lycan Princess Won't Be Your",
      imageUrl: AppImages.rewards_image,
      views: "127k",
      description:
          "An intense journey where danger, courage, and survival collide in a high-stakes battle.",
    ),
  ].obs;

  final RxList<MovieModel> recentlyWatched = <MovieModel>[
    MovieModel(
      title: "Spider-Man Brand New Day",
      imageUrl: AppImages.rewards_image,
    ),
    MovieModel(
      title: "Crimson Chars Exclusive",
      imageUrl: AppImages.rewards_image,
      badge: "Exclusive",
    ),
    MovieModel(
      title: "Spider-Man Brand New Day",
      imageUrl: AppImages.rewards_image,
    ),
    MovieModel(title: "Joker", imageUrl: AppImages.rewards_image),
  ].obs;

  final RxList<MovieModel> youMightLike = <MovieModel>[
    MovieModel(
      title: "Crimson Chars Exclusive",
      imageUrl: AppImages.rewards_image,
      isVip: true,
      views: "3.1M",
    ),
    MovieModel(
      title: "Avatar The Way Of Water",
      imageUrl: AppImages.rewards_image,
      isVip: true,
      views: "307k",
    ),
    MovieModel(
      title: "Spider-Man Brand New Day",
      imageUrl: AppImages.rewards_image,
    ),
  ].obs;

  final RxList<MovieModel> mostPopularSeries = <MovieModel>[
    MovieModel(
      title: "Wednesday Exclusive",
      imageUrl: AppImages.rewards_image,
      isVip: true,
      views: "5.1M",
    ),
    MovieModel(
      title: "The Originals Most Popular Series",
      imageUrl: AppImages.rewards_image,
    ),
    MovieModel(
      title: "Game Of Thrones New Series",
      imageUrl: AppImages.rewards_image,
      badge: "New",
      views: "13.8M",
    ),
  ].obs;

  void changeTab(int index) => selectedTab.value = index;
  void changeRankingTab(int index) => selectedRankingTab.value = index;
  void changeVipFilter(int index) => selectedVipFilter.value = index;
  void changeCategory(int index) => selectedCategory.value = index;

  List<MovieModel> getCategoryMovies(int index) {
    if (index == 0) {
      return [
        MovieModel(title: "Spider-Man Brand New Day", imageUrl: AppImages.rewards_image, views: "12.1M"),
        MovieModel(title: "Crimson Chars Exclusive", imageUrl: AppImages.rewards_image, views: "3.1M"),
        MovieModel(title: "Sicario", imageUrl: AppImages.rewards_image, views: "1.1M"),
      ];
    } else if (index == 1) {
      return [
        MovieModel(title: "Legacies", imageUrl: AppImages.rewards_image, views: "827k"),
        MovieModel(title: "Game Of Thrones", imageUrl: AppImages.rewards_image, views: "2.3M"),
      ];
    } else if (index == 2) {
      return [
        MovieModel(title: "Glass In Cinemas January 1st", imageUrl: AppImages.move_2, views: "12.1M"),
        MovieModel(title: "Mega New Day", imageUrl: AppImages.rewards_image, views: "3.1M"),
      ];
    } else {
      return [
        MovieModel(title: "Joker", imageUrl: AppImages.rewards_image, views: "25.1k"),
        MovieModel(title: "Crimson Chars Age Gap", imageUrl: AppImages.rewards_image, views: "3.1M"),
      ];
    }
  }
}
