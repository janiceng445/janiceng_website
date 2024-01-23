import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewScreen extends StatelessWidget {
  final String imageUrl;
  final String header;
  final String description;
  const PhotoViewScreen({
    super.key,
    required this.imageUrl,
    required this.header,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pop(),
        foregroundColor: Colors.white,
        backgroundColor: Colors.transparent,
        shape: const CircleBorder(),
        elevation: 10,
        child: const Icon(Icons.close),
      ),
      body: Center(
        child: Hero(
          tag: 'heroTag-$imageUrl',
          child: PhotoView(
            imageProvider: AssetImage(imageUrl),
          ),
        ),
      ),
    );
  }
}
