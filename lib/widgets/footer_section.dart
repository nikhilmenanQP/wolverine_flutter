import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(colors: [Colors.black, Color(0xFF3A3A3A)]),
      ),
      child: Column(
        children: [
          // Top Footer Row
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Company Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Company',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 40),

              // Quick Links
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Quick Links',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    FooterLink(text: 'About Us'),
                    FooterLink(text: 'Services'),
                    FooterLink(text: 'Contact'),
                    FooterLink(text: 'Privacy Policy'),
                  ],
                ),
              ),

              SizedBox(width: 40),

              // HERE: Newsletter
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Newsletter',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Subscribe to our newsletter for updates.',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 300,
                      child: TextField(
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Enter your email',
                          hintStyle: const TextStyle(color: Colors.white54),
                          filled: true,
                          fillColor: Colors.black,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 300,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(
                            0xFF3B82F6,
                          ), // Blue color
                          padding: const EdgeInsets.symmetric(vertical: 22),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: const Text(
                          'Subscribe',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),

          // Bottom Copyright
          const Divider(color: Colors.white24),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: const Text(
              '© 2025 Company Name. All rights reserved.',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Footer Link Text
class FooterLink extends StatelessWidget {
  final String text;

  const FooterLink({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(text, style: const TextStyle(color: Colors.grey)),
    );
  }
}
