import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavBarMobile extends StatelessWidget {
  const BottomNavBarMobile({super.key});

  final List<String> _routes = const ['/', '/sports', '/movies', '/signin'];

  int _currentIndex(String location) {
    return _routes.indexWhere((r) => location.startsWith(r));
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final currentIndex = _currentIndex(location);

    return BottomNavigationBar(
      currentIndex: currentIndex,
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        if (index >= 0 && index < _routes.length) {
          context.go(_routes[index]);
        }
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Icon(Icons.sports_basketball_rounded),
          label: 'Sports',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.movie_filter_sharp),
          label: 'Movies',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Account'),
      ],
    );
  }
}
