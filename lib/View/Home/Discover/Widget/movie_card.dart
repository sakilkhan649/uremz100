import 'package:flutter/material.dart';
import 'package:uremz100/View/Home/Discover/Model/discover_model.dart';
import '../../../../Utils/app_images.dart';

class MovieCard extends StatelessWidget {
  final MovieModel movie;
  final VoidCallback? onTap;
  final bool showRank;

  const MovieCard({
    super.key,
    required this.movie,
    this.onTap,
    this.showRank = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 110, // Fixed width for consistent horizontal lists
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Stack(
                children: [
                  // Movie Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      movie.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[800],
                          child: const Icon(Icons.movie, color: Colors.white54),
                        );
                      },
                    ),
                  ),

                  // Rank Badge (if applicable)
                  if (showRank && movie.rank != null)
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: const BoxDecoration(
                          color: Colors.orange, // Customize color as needed
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8),
                          ),
                        ),
                        child: Text(
                          "${movie.rank}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),

                  // Badge (New, Exclusive, VIP)
                  if (movie.badge != null || movie.isVip)
                    Positioned(
                      top: 6,
                      right: 6,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                        decoration: BoxDecoration(
                          color: movie.isVip ? Colors.amber : Colors.red,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          movie.isVip ? "VIP" : movie.badge!,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  
                   // Views Overlay (Bottom Left)
                  if (movie.views != null)
                     Positioned(
                      bottom: 4,
                      left: 4,
                      child: Container(
                         padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                         decoration: BoxDecoration(
                           color: Colors.black.withOpacity(0.6),
                           borderRadius: BorderRadius.circular(4)
                         ),
                         child: Row(
                           children: [
                             const Icon(Icons.play_arrow, size: 10, color: Colors.white),
                             const SizedBox(width: 2),
                             Text(
                               movie.views!,
                               style: const TextStyle(
                                 color: Colors.white,
                                 fontSize: 10,
                               ),
                             )
                           ],
                         ),
                      )
                     ),
                ],
              ),
            ),
            const SizedBox(height: 6),
            // Title
            Text(
              movie.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
