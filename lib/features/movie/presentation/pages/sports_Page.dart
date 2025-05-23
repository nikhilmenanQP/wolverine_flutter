import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:wolverine/core/widgets/footer_section.dart';
import 'package:wolverine/core/widgets/home_carousel.dart';
import 'package:wolverine/core/widgets/movie_section.dart';
import 'package:wolverine/utils/responsive_sizes.dart';

class SportsPage extends StatelessWidget {
  SportsPage({super.key});

  final List<String> _carouselImages = List.generate(
    10,
    (index) => 'https://picsum.photos/800/400?random=$index',
  );

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
                HomeCarousel(
                  carouselImages: _carouselImages,
                  carouselHeight: getResponsiveSize(
                    sizingInfo: sizingInformation,
                    mobile: 520,
                    tablet: 520,
                    desktop: 620,
                  ),
                ),
                MovieSection(
                  sizingInformation: sizingInformation,
                  movieList: _movieList,
                  genre: 'Header 2',
                  containerHeight: [80, 140, 180],
                  height: [70, 120, 150],
                  width: [120, 200, 260],
                ),
                MovieSection(
                  sizingInformation: sizingInformation,
                  movieList: _movieList,
                  genre: 'Header 3',
                  containerHeight: [80, 140, 180],
                  height: [70, 120, 150],
                  width: [120, 200, 260],
                ),
                MovieSection(
                  containerHeight: [80, 140, 180],
                  genre: 'Header 4',
                  height: [70, 120, 150],
                  movieList: _movieList,
                  sizingInformation: sizingInformation,
                  width: [120, 200, 260],
                ),
                MovieSection(
                  containerHeight: [80, 140, 180],
                  genre: 'Header 5',
                  height: [70, 120, 150],
                  movieList: _movieList,
                  sizingInformation: sizingInformation,
                  width: [120, 200, 260],
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
}
