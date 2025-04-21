import 'package:flutter/material.dart';
import 'package:wolverine/widgets/footer_section.dart';
import 'package:wolverine/widgets/movie_list_section.dart';

class MoviesPage extends StatelessWidget {
  MoviesPage({super.key});

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
    return Column(
      children: [
        MovieListSection(
          movieList: movieList,
          genreType: 'Header 1',
          cardContainerHeight: 160,
          cardHeight: 150,
          cardWidth: 260,
        ),
        MovieListSection(
          movieList: movieList,
          genreType: 'Header 2',
          cardContainerHeight: 190,
          cardHeight: 180,
          cardWidth: 180,
        ),
        MovieListSection(
          movieList: movieList,
          genreType: 'Header 3',
          cardContainerHeight: 310,
          cardHeight: 300,
          cardWidth: 180,
        ),
        MovieListSection(
          movieList: movieList,
          genreType: 'Header 4',
          cardContainerHeight: 160,
          cardHeight: 150,
          cardWidth: 260,
        ),
        const FooterSection(),
      ],
    );
  }
}
