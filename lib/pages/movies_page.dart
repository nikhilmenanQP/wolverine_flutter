import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:wolverine/utils/responsive_sizes.dart';
import 'package:wolverine/widgets/footer_section.dart';
import 'package:wolverine/widgets/movie_list_section.dart';

class MoviesPage extends StatelessWidget {
  MoviesPage({super.key});

  final List<Map<String, String>> _movieList = List.generate(
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
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildMovieSection(
                  sizingInformation,
                  genre: 'Header 1',
                  containerHeight: [80, 140, 180],
                  height: [70, 120, 150],
                  width: [120, 200, 260],
                ),
                _buildMovieSection(
                  sizingInformation,
                  genre: 'Header 2',
                  containerHeight: [110, 180, 200],
                  height: [100, 160, 180],
                  width: [100, 160, 180],
                ),
                _buildMovieSection(
                  sizingInformation,
                  genre: 'Header 3',
                  containerHeight: [160, 280, 320],
                  height: [150, 260, 300],
                  width: [92, 160, 180],
                ),
                _buildMovieSection(
                  sizingInformation,
                  genre: 'Header 4',
                  containerHeight: [100, 160, 180],
                  height: [70, 120, 150],
                  width: [120, 200, 260],
                  showTitle: false,
                ),
                const SizedBox(height: 16),
                if (sizingInformation.deviceScreenType ==
                    DeviceScreenType.desktop)
                  const FooterSection(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildMovieSection(
    SizingInformation sizingInformation, {
    required String genre,
    required List<double> containerHeight,
    required List<double> height,
    required List<double> width,
    bool showTitle = false,
  }) {
    return MovieListSection(
      movieList: _movieList,
      genreType: genre,
      showTitle: showTitle,
      cardContainerHeight: getResponsiveSize(
        sizingInfo: sizingInformation,
        mobile: containerHeight[0],
        tablet: containerHeight[1],
        desktop: containerHeight[2],
      ),
      cardHeight: getResponsiveSize(
        sizingInfo: sizingInformation,
        mobile: height[0],
        tablet: height[1],
        desktop: height[2],
      ),
      cardWidth: getResponsiveSize(
        sizingInfo: sizingInformation,
        mobile: width[0],
        tablet: width[1],
        desktop: width[2],
      ),
    );
  }
}
