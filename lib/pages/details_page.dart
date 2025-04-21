import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wolverine/widgets/movie_list_section.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key, this.movieId});

  final String? movieId;

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeroSection(movieId: movieId),
        InfoSection(),
        OverviewSection(),
        const SizedBox(height: 16),
        MovieListSection(
          movieList: movieList,
          genreType: 'More like this',
          cardContainerHeight: 320,
          cardHeight: 300,
          cardWidth: 180,
        ),
      ],
    );
  }
}

// CHECK: Info-Screen
class HeroSection extends StatelessWidget {
  const HeroSection({super.key, this.movieId});

  final String? movieId;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background Image
        Container(
          height: 500,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("https://picsum.photos/200/300"),
              fit: BoxFit.cover,
            ),
          ),
        ),

        // Gradient Overlay
        Container(
          height: 500,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [Colors.black, Colors.transparent.withAlpha(128)],
            ),
          ),
        ),

        // Title, Description, Buttons
        Positioned(
          left: 20,
          right: 20,
          bottom: 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Title, MovieID: $movieId",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                "Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of  (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, comes from a line in section 1.10.32. The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorum by Cicero are also reproduced in their exact original form, accompanied by...",
                style: TextStyle(color: Colors.white, fontSize: 18),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.play_arrow, color: Colors.white, size: 32),
                    label: Text(
                      "Play",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white70.withAlpha(
                        128,
                      ), // semi-transparent dark
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          4,
                        ), // rounded corners
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      elevation: 0, // no shadow
                    ),
                  ),
                  const SizedBox(width: 14),
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.info_outline,
                      color: Colors.white,
                      size: 32,
                    ),
                    label: Text(
                      "More Info",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white70.withAlpha(
                        128,
                      ), // semi-transparent dark
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          4,
                        ), // rounded corners
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 12,
                      ),
                      elevation: 0, // no shadow
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Back button
        Positioned(
          top: 16,
          left: 16,
          child: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              context.go('/'); // or Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}

// CHECK: Info-Screen
class InfoSection extends StatelessWidget {
  const InfoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "John Wick",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),

          const SizedBox(height: 8),

          Row(
            children: [
              _buildTag(
                "R",
                bgColor: Colors.white.withAlpha(50),
                textColor: Colors.white,
                textSize: 12,
              ),
              const SizedBox(width: 8),
              _buildTag(
                "TV",
                bgColor: Colors.white.withAlpha(50),
                textColor: Colors.white,
                textSize: 12,
              ),
              const SizedBox(width: 1),
              _buildTag("Action"),
              const Text('•', style: TextStyle(color: Colors.grey)),
              _buildTag("Violence"),
              const Text('•', style: TextStyle(color: Colors.grey)),
              _buildTag("Crime"),
            ],
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              _buildIconButton(Icons.add, "Watchlist"),
              const SizedBox(width: 20),
              _buildIconButton(Icons.share_outlined, "Share"),
            ],
          ),
        ],
      ),
    );
  }

  // Helper for Tags
  Widget _buildTag(
    String label, {
    Color bgColor = Colors.transparent,
    Color textColor = Colors.grey,
    double textSize = 16,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(
        label,
        style: TextStyle(color: textColor, fontSize: textSize),
      ),
    );
  }

  // Helper for Icon Buttons
  Widget _buildIconButton(IconData icon, String label) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withAlpha(50),
            borderRadius: BorderRadius.circular(50),
          ),
          padding: EdgeInsets.all(8),
          child: Icon(icon, color: Colors.white),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(color: Colors.white70, fontSize: 12),
        ),
      ],
    );
  }
}

// CHECK: Overview Section
class OverviewSection extends StatefulWidget {
  const OverviewSection({super.key});

  @override
  State<OverviewSection> createState() => _OverviewSectionState();
}

class _OverviewSectionState extends State<OverviewSection> {
  bool isExpanded = false;

  final String overviewText =
      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. "
      "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. "
      "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "
      "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AnimatedCrossFade(
            firstChild: Text(
              overviewText,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            secondChild: Text(
              overviewText,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            crossFadeState:
                isExpanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 300),
          ),
          const SizedBox(height: 8),
          GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Text(
              isExpanded ? "Read Less" : "Read More",
              style: const TextStyle(
                color: Colors.blueAccent,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
