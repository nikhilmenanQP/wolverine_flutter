import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MovieListSection extends StatelessWidget {
  const MovieListSection({
    super.key,
    required this.movieList,
    this.cardContainerHeight = 250,
    this.cardHeight = 120,
    this.cardWidth = 220,
    this.showTitle = false,
    this.showSubtitle = false,
    required this.genreType,
  });

  final List<Map<String, String>> movieList;
  final double cardContainerHeight;
  final double cardHeight;
  final double cardWidth;
  final bool showTitle;
  final bool showSubtitle;
  final String genreType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
            child: Text(
              genreType,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
        SizedBox(
          height: cardContainerHeight,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: movieList.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              final movie = movieList[index];
              final movieId = movie['id'] ?? index.toString();

              return GestureDetector(
                onTap: () {
                  context.go('/details/$movieId');
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.network(
                        movie['image']!,
                        height: cardHeight,
                        width: cardWidth,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 8),
                    if (showTitle)
                      Text(
                        movie['title']!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    if (showSubtitle)
                      Text(
                        movie['subtitle']!,
                        style: const TextStyle(
                          color: Colors.white60,
                          fontSize: 12,
                        ),
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
