import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wolverine/l10n/app_localizations.dart';

class BottomNavBarMobile extends StatelessWidget {
  const BottomNavBarMobile({super.key});

  static const List<String> _routes = ['/', '/sports', '/movies', '/account'];

  int _getCurrentIndex(String location) {
    for (int i = 0; i < _routes.length; i++) {
      if (location == _routes[i] || location.startsWith('${_routes[i]}/')) {
        return i;
      }
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    final currentIndex = _getCurrentIndex(location);

    return BottomNavigationBar(
      currentIndex: currentIndex,
      backgroundColor: Colors.black,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        if (index >= 0 &&
            index < _routes.length &&
            location != _routes[index]) {
          context.go(_routes[index]);
        }
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: AppLocalizations.of(context)!.home,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.sports_basketball_rounded),
          label: AppLocalizations.of(context)!.sports,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.movie_filter_sharp),
          label: AppLocalizations.of(context)!.movies,
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: AppLocalizations.of(context)!.account,
        ),
      ],
    );
  }
}
