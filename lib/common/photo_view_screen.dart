import 'package:flutter/material.dart';

class PhotoViewScreen extends StatelessWidget {
  final String imageUrl;
  const PhotoViewScreen({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(tag: 'heroTag-$imageUrl', child: Image.network(imageUrl)),
    );
  }
}
