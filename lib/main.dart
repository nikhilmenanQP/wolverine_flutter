import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:wolverine/l10n/app_localizations.dart';
import 'package:wolverine/pages/account_page.dart';
import 'package:wolverine/pages/details_page.dart';
import 'package:wolverine/pages/home_page.dart';
import 'package:wolverine/pages/movies_page.dart';
import 'package:wolverine/pages/signin_page.dart';
import 'package:wolverine/pages/sports_Page.dart';
import 'package:wolverine/widgets/bottomNavBar_mobile.dart';
import 'package:wolverine/widgets/custom_app_bar.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return ScrollableScaffold(child: child);
      },
      routes: [
        GoRoute(
          path: '/',
          pageBuilder: (context, state) => NoTransitionPage(child: HomePage()),
        ),
        GoRoute(
          path: '/movies',
          pageBuilder:
              (context, state) => NoTransitionPage(child: MoviesPage()),
        ),
        GoRoute(
          path: '/sports',
          pageBuilder:
              (context, state) => NoTransitionPage(child: SportsPage()),
        ),
        GoRoute(
          path: '/signin',
          pageBuilder:
              (context, state) => const NoTransitionPage(child: SignInPage()),
        ),
        GoRoute(
          path: '/account',
          pageBuilder:
              (context, state) => const NoTransitionPage(child: AccountPage()),
        ),
        GoRoute(
          path: '/details/:id',
          pageBuilder: (context, state) {
            final movieId = state.pathParameters['id'];
            return NoTransitionPage(child: DetailsPage(movieId: movieId));
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();

  static _MyAppState of(BuildContext context) {
    return context.findAncestorStateOfType<_MyAppState>()!;
  }
}

class _MyAppState extends State<MyApp> {
  Locale _locale = const Locale('en');

  void setLocale(Locale newLocale) {
    setState(() {
      _locale = newLocale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Wolverine',
      routerConfig: _router,
      locale: _locale,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}

class ScrollableScaffold extends StatefulWidget {
  final Widget child;

  const ScrollableScaffold({super.key, required this.child});

  @override
  State<ScrollableScaffold> createState() => _ScrollableScaffoldState();
}

class _ScrollableScaffoldState extends State<ScrollableScaffold> {
  final ScrollController _scrollController = ScrollController();
  double _scrollOffset = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        _scrollOffset = _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile:
          (_) => Scaffold(
            backgroundColor: Colors.black,
            body: SingleChildScrollView(child: widget.child),
            bottomNavigationBar: SafeArea(child: const BottomNavBarMobile()),
          ),
      tablet:
          (_) => Scaffold(
            backgroundColor: Colors.black,
            body: SingleChildScrollView(child: widget.child),
            bottomNavigationBar: const SafeArea(child: BottomNavBarMobile()),
          ),
      desktop: (_) => _buildWebLayout(),
    );
  }

  Widget _buildWebLayout() {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(scrollOffset: _scrollOffset),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: widget.child,
      ),
    );
  }
}
