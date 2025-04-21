import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double scrollOffset;
  const CustomAppBar({super.key, required this.scrollOffset});

  @override
  Widget build(BuildContext context) {
    final bool isScrolled = scrollOffset > 10; // You can fine-tune this
    final currentLocation = GoRouterState.of(context).uri.toString();

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: isScrolled ? Colors.white.withAlpha(128) : Colors.transparent,
      ),
      child: ClipRect(
        child: Row(
          children: [
            SvgPicture.asset('assets/logo.svg', height: 50, width: 200),
            const SizedBox(width: 16),
            NavItem(
              title: 'Home',
              onPress: () => context.go('/'),
              isSelected: currentLocation == '/',
            ),
            const SizedBox(width: 20),
            NavItem(
              title: 'Sports',
              onPress: () => context.go('/sports'),
              isSelected: currentLocation == '/sports',
            ),
            const SizedBox(width: 20),
            NavItem(
              title: 'Movies',
              onPress: () => context.go('/movies'),
              isSelected: currentLocation == '/movies',
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.search, color: Colors.white, size: 32),
              onPressed: () {},
            ),
            const SizedBox(width: 16),
            ElevatedButton.icon(
              onPressed: () => context.go('/signin'),
              icon: const Icon(Icons.person, size: 28),
              label: const Text("Sign In", style: TextStyle(fontSize: 16)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 16,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
              ),
            ),
            const SizedBox(width: 16),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: Colors.grey,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text("JA", style: TextStyle(color: Colors.black)),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text("EN", style: TextStyle(color: Colors.white)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}

class NavItem extends StatelessWidget {
  final String title;
  final dynamic onPress;
  final bool isSelected;

  const NavItem({
    required this.title,
    required this.onPress,
    required this.isSelected,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.grey,
          fontSize: 16,
        ),
      ),
    );
  }
}
