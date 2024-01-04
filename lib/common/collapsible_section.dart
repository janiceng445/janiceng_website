import 'package:flutter/material.dart';

class CollapsibleSection extends StatefulWidget {
  final String title;
  const CollapsibleSection({
    super.key,
    required this.title,
  });

  @override
  State<CollapsibleSection> createState() => _CollapsibleSectionState();
}

class _CollapsibleSectionState extends State<CollapsibleSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(widget.title),
        ],
      ),
    );
  }
}
