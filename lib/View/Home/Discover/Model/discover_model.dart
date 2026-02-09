class MovieModel {
  final String title;
  final String imageUrl;
  final String? badge; // 'Exclusive', 'New', 'VIP', etc.
  final String? views; // for ranking / recently watched
  final int? rank; // for ranking list
  final bool isVip;
  final String? description; // for ranking items

  MovieModel({
    required this.title,
    required this.imageUrl,
    this.badge,
    this.views,
    this.rank,
    this.isVip = false,
    this.description,
  });
}

class SectionModel {
  final String title;
  final List<MovieModel> movies;
  final bool hasViewAll;

  SectionModel({
    required this.title,
    required this.movies,
    this.hasViewAll = false,
  });
}
