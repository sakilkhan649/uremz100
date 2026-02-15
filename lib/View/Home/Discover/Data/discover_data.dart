import '../Models/discrive_models.dart';
import '../../../../Utils/app_images.dart';

class DiscoverData {
  static final List<String> categories = [
    'Popular',
    'New',
    'VIP',
    'Ranking',
    'Categories',
  ];

  static final List<DiscoverMovie> allMovies = [
    DiscoverMovie(
      id: '1',
      title: 'Spider-Man',
      subtitle: 'Hiden Identity',
      image: AppImages.move_1,
      badge: 'Exclusive',
      views: '5.3M',
      categories: ['Popular', 'New'],
    ),
    DiscoverMovie(
      id: '2',
      title: 'Crimson Chars',
      subtitle: 'Revenge',
      image: AppImages.move_2,
      badge: 'Exclusive',
      views: '1.2M',
      categories: ['Popular', 'VIP'],
      isVip: true,
    ),
    DiscoverMovie(
      id: '3',
      title: 'Glass in Cinemas',
      subtitle: 'Age Gap',
      image: AppImages.move_3,
      views: '12.1M',
      categories: ['Popular', 'New'],
    ),
    DiscoverMovie(
      id: '4',
      title: 'Lycan Princess Won\'t Be Your',
      subtitle: 'An intense journey...',
      image: AppImages.move_4,
      views: '127k',
      categories: ['Ranking'],
    ),
    DiscoverMovie(
      id: '5',
      title: 'Wednesday Chars',
      subtitle: 'Exclusive',
      image: AppImages.move_5,
      badge: 'Exclusive',
      views: '7.1M',
      categories: ['VIP'],
      isVip: true,
    ),
  ];

  static final List<BonusItem> dailyBonus = [
    BonusItem(coins: 10, time: '5mins'),
    BonusItem(coins: 15, time: '10mins'),
    BonusItem(coins: 20, time: '20mins'),
    BonusItem(coins: 25, time: '30mins'),
    BonusItem(coins: 35, time: '10mins'),
    BonusItem(coins: 45, time: '10mins'),
    BonusItem(coins: 50, time: '20mins'),
    BonusItem(coins: 80, time: 'Day2'),
  ];
}
