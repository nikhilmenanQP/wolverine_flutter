import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:wolverine/utils/responsive_sizes.dart';
import 'package:wolverine/widgets/movie_list_section.dart';

class MovieSection extends StatelessWidget {
  const MovieSection({
    super.key,
    required this.containerHeight,
    required this.height,
    required this.movieList,
    required this.sizingInformation,
    required this.width,
    this.genre = '',
    this.showTitle = false,
  });

  final bool showTitle;
  final List<double> containerHeight;
  final List<double> height;
  final List<double> width;
  final List<Map<String, String>> movieList;
  final SizingInformation sizingInformation;
  final String genre;

  @override
  Widget build(BuildContext context) {
    return MovieListSection(
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
      genreType: genre,
      movieList: movieList,
      showTitle: showTitle,
    );
  }
}
