import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:wolverine/l10n/app_localizations.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => const AccountScreen(),
      tablet: (_) => const AccountScreen(),
      desktop: (_) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          context.go('/signin');
        });
        return const Scaffold(body: SizedBox());
      },
    );
  }
}

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  static const TextStyle sectionTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 16,
  );
  static const EdgeInsets sectionPadding = EdgeInsets.symmetric(
    horizontal: 20,
    vertical: 5,
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 40),

          // Profile Image Section
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://picsum.photos/200/300'),
            ),
          ),
          const SizedBox(height: 30),

          // Profile Options Section
          _SectionHeader(title: AppLocalizations.of(context)!.edit_profile),
          _SectionHeader(title: AppLocalizations.of(context)!.orders),
          _SectionHeader(title: AppLocalizations.of(context)!.payment_methods),
          _SectionHeader(title: AppLocalizations.of(context)!.settings),
          _SectionHeader(title: AppLocalizations.of(context)!.help_and_support),

          // Login Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: GestureDetector(
              onTap: () {
                context.go('/signin');
              },
              child: Text(
                AppLocalizations.of(context)!.login,
                style: TextStyle(color: Colors.red, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;

  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: AccountScreen.sectionPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: AccountScreen.sectionTextStyle),
            const SizedBox(height: 5),
            const Divider(color: Colors.grey),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
