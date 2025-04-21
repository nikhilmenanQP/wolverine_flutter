import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeCarousel extends StatefulWidget {
  final List<String> carouselImages;

  const HomeCarousel({super.key, required this.carouselImages});

  @override
  State<HomeCarousel> createState() => _HomeCarousel();
}

class _HomeCarousel extends State<HomeCarousel> {
  int _currentIndex = 0;
  final CarouselSliderController _carouselController =
      CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          carouselController: _carouselController,
          options: CarouselOptions(
            height: 620,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
          items:
              widget.carouselImages.map((url) {
                return Image.network(
                  url,
                  fit: BoxFit.cover,
                  width: double.infinity,
                );
              }).toList(),
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                widget.carouselImages.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _carouselController.animateToPage(entry.key),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: _currentIndex == entry.key ? 12.0 : 8.0,
                      height: _currentIndex == entry.key ? 12.0 : 8.0,
                      margin: const EdgeInsets.symmetric(horizontal: 4.0),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color:
                            _currentIndex == entry.key
                                ? Colors.white
                                : Colors.white.withAlpha(128),
                      ),
                    ),
                  );
                }).toList(),
          ),
        ),
      ],
    );
  }
}
