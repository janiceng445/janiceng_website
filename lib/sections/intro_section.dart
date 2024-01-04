import 'package:flutter/material.dart';

class IntroSection extends StatelessWidget {
  final String content;
  const IntroSection({
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
