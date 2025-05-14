import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeCarousel extends StatefulWidget {
  final List<String> carouselImages;
  final double carouselHeight;

  const HomeCarousel({
    super.key,
    required this.carouselImages,
    this.carouselHeight = 620,
  });

  @override
  State<HomeCarousel> createState() => _HomeCarouselState();
}

class _HomeCarouselState extends State<HomeCarousel> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
  int _currentIndex = 0;

  void _onPageChanged(int index, CarouselPageChangedReason reason) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: widget.carouselImages.length,
          carouselController: _carouselController,
          options: CarouselOptions(
            height: widget.carouselHeight,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1,
            onPageChanged: _onPageChanged,
          ),
          itemBuilder: (context, index, _) {
            final imageUrl = widget.carouselImages[index];
            return CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              placeholder:
                  (context, url) =>
                      const Center(child: CircularProgressIndicator()),
              errorWidget:
                  (context, url, error) =>
                      const Center(child: Icon(Icons.error)),
            );
          },
        ),
        Positioned(bottom: 20, left: 0, right: 0, child: _buildDotsIndicator()),
      ],
    );
  }

  Widget _buildDotsIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.carouselImages.length, (index) {
        final isActive = _currentIndex == index;
        return GestureDetector(
          onTap: () => _carouselController.animateToPage(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: isActive ? 12.0 : 8.0,
            height: isActive ? 12.0 : 8.0,
            margin: const EdgeInsets.symmetric(horizontal: 4.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? Colors.white : Colors.white.withAlpha(128),
            ),
          ),
        );
      }),
    );
  }
}
