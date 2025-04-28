import 'package:flutter/material.dart';
import 'package:wolverine/l10n/app_localizations.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({super.key});

  @override
  State<StatefulWidget> createState() {
    return _CustomSearchBar();
  }
}

class _CustomSearchBar extends State<CustomSearchBar> {
  bool isSearching = false;
  final TextEditingController _controller = TextEditingController();

  void _toggleSearch() {
    setState(() {
      isSearching = !isSearching;
      _controller.clear();
    });
  }

  void _onSearchChanged(String query) {
    // Write your code here...
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      child:
          isSearching
              ? Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Row(
                  children: [
                    SizedBox(width: 16),
                    SizedBox(
                      width: 240,
                      child: TextField(
                        controller: _controller,
                        onChanged: _onSearchChanged,
                        style: const TextStyle(color: Colors.black),
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.search_here,
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: _toggleSearch,
                      icon: const Icon(Icons.search, color: Colors.black),
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              )
              : IconButton(
                icon: const Icon(Icons.search, color: Colors.white, size: 28),
                onPressed: _toggleSearch,
              ),
    );
  }
}
