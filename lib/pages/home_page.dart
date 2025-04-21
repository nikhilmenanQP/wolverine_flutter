import 'package:flutter/material.dart';
import 'package:wolverine/widgets/footer_section.dart';
import 'package:wolverine/widgets/home_carousel.dart';
import 'package:wolverine/widgets/movie_list_section.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<String> carouselImages = List.generate(
    10,
    (index) => 'https://picsum.photos/800/400?random=$index',
  );

  final List<Map<String, String>> movieList = List.generate(
    10,
    (index) => {
      'id': '$index',
      'title': 'Movie $index',
      'subtitle': 'Subtitle $index',
      'image': 'https://picsum.photos/200/300?random=$index',
    },
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeCarousel(carouselImages: carouselImages),
          MovieListSection(
            movieList: movieList,
            genreType: 'Header 2',
            cardContainerHeight: 180,
            cardHeight: 150,
            cardWidth: 260,
          ),
          MovieListSection(
            movieList: movieList,
            genreType: 'Header 3',
            cardContainerHeight: 240,
            cardHeight: 180,
            cardWidth: 180,
          ),
          MovieListSection(
            movieList: movieList,
            genreType: 'Header 4',
            cardContainerHeight: 180,
            cardHeight: 150,
            cardWidth: 260,
            showTitle: true,
          ),
          MovieListSection(
            movieList: movieList,
            genreType: 'Header 5',
            cardContainerHeight: 320,
            cardHeight: 300,
            cardWidth: 180,
          ),
          const SizedBox(height: 16),
          FooterSection(),
        ],
      ),
    );
  }
}
