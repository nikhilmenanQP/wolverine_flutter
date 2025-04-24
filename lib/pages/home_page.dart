import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:wolverine/utils/responsive_sizes.dart';
import 'package:wolverine/widgets/footer_section.dart';
import 'package:wolverine/widgets/home_carousel.dart';
import 'package:wolverine/widgets/movie_list_section.dart';
import 'package:wolverine/widgets/movie_section.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  // Memoized carousel images
  final List<String> _carouselImages = List.generate(
    10,
    (index) => 'https://picsum.photos/800/400?random=$index',
  );

  // Memoized movie list
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
                  containerHeight: [80, 140, 180],
                  genre: 'Header 2',
                  height: [70, 120, 150],
                  movieList: _movieList,
                  sizingInformation: sizingInformation,
                  width: [120, 200, 260],
                ),
                MovieSection(
                  containerHeight: [110, 180, 200],
                  genre: 'Header 3',
                  height: [100, 160, 180],
                  movieList: _movieList,
                  sizingInformation: sizingInformation,
                  width: [100, 160, 180],
                ),
                MovieSection(
                  containerHeight: [100, 160, 180],
                  genre: 'Header 4',
                  height: [70, 120, 150],
                  movieList: _movieList,
                  showTitle: true,
                  sizingInformation: sizingInformation,
                  width: [120, 200, 260],
                ),
                MovieSection(
                  containerHeight: [160, 280, 320],
                  genre: 'Header 5',
                  height: [150, 260, 300],
                  movieList: _movieList,
                  sizingInformation: sizingInformation,
                  width: [92, 160, 180],
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
