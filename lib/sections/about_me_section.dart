import 'package:flutter/material.dart';

class AboutMeSection extends StatelessWidget {
  final String content;
  const AboutMeSection({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(content),
    );
  }
}
