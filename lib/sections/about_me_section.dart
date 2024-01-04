import 'package:flutter/material.dart';

class AboutMeSection extends StatelessWidget {
  final String content;
  const AboutMeSection({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 600,
      child: Column(
        children: [
          const Text(
            'About Me',
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
            ),
          ),
          Text(
            content,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
