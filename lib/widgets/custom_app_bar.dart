import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:wolverine/widgets/custom_search_bar.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double scrollOffset;

  const CustomAppBar({super.key, required this.scrollOffset});

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    final bool isScrolled = scrollOffset > 10;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      decoration: BoxDecoration(
        color: isScrolled ? Colors.white.withAlpha(200) : Colors.transparent,
        boxShadow:
            isScrolled
                ? [const BoxShadow(color: Colors.black12, blurRadius: 4)]
                : null,
      ),
      child: Row(
        children: const [
          _Logo(),
          SizedBox(width: 16),
          _NavBarItems(),
          Spacer(),
          _AppBarActions(),
        ],
      ),
    );
  }
}

class _Logo extends StatelessWidget {
  const _Logo();

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/logo.svg', height: 40);
  }
}

class _NavBarItems extends StatelessWidget {
  const _NavBarItems();

  @override
  Widget build(BuildContext context) {
    final String currentLocation = GoRouterState.of(context).uri.toString();
    final double screenWidth = MediaQuery.of(context).size.width;

    List<NavItem> navItems = [];

    if (screenWidth >= 1000) {
      navItems.add(
        NavItem(title: 'Home', route: '/', isSelected: currentLocation == '/'),
      );
    }
    if (screenWidth >= 1050) {
      navItems.add(
        NavItem(
          title: 'Sports',
          route: '/sports',
          isSelected: currentLocation == '/sports',
        ),
      );
    }
    if (screenWidth >= 1120) {
      navItems.add(
        NavItem(
          title: 'Movies',
          route: '/movies',
          isSelected: currentLocation == '/movies',
        ),
      );
    }

    return Row(children: navItems);
  }
}

class _AppBarActions extends StatelessWidget {
  const _AppBarActions();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        CustomSearchBar(),
        SizedBox(width: 16),
        _SignInButton(),
        SizedBox(width: 16),
        LanguageSwitch(),
      ],
    );
  }
}

class _SignInButton extends StatelessWidget {
  const _SignInButton();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () => context.go('/signin'),
      icon: const Icon(Icons.person, size: 24),
      label: const Text('Sign In', style: TextStyle(fontSize: 14)),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      ),
    );
  }
}

class LanguageSwitch extends StatefulWidget {
  const LanguageSwitch({super.key});

  @override
  State<LanguageSwitch> createState() => _LanguageSwitchState();
}

class _LanguageSwitchState extends State<LanguageSwitch> {
  bool isEnglish = true;

  void toggleLanguage() {
    setState(() => isEnglish = !isEnglish);
    debugPrint('Selected language: ${isEnglish ? 'EN' : 'JA'}');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleLanguage,
      child: Container(
        width: 90,
        height: 36,
        decoration: BoxDecoration(
          color: Colors.grey.shade400,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          children: [
            const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('JA', style: TextStyle(color: Colors.black)),
                  SizedBox(width: 28),
                  Text('EN', style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
            AnimatedAlign(
              duration: const Duration(milliseconds: 200),
              alignment:
                  isEnglish ? Alignment.centerRight : Alignment.centerLeft,
              child: Container(
                width: 45,
                height: 36,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(24),
                ),
                alignment: Alignment.center,
                child: Text(
                  isEnglish ? 'EN' : 'JA',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  final String title;
  final String route;
  final bool isSelected;

  const NavItem({
    super.key,
    required this.title,
    required this.route,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.go(route),
      style: TextButton.styleFrom(
        foregroundColor: isSelected ? Colors.white : Colors.grey.shade400,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        ),
      ),
    );
  }
}
