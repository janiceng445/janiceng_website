import 'package:flutter/material.dart';

class IntroSection extends StatelessWidget {
  final String content;
  const IntroSection({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 500,
      child: Text(
        content,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
