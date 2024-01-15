import 'package:flutter/material.dart';
import 'package:janiceng_website/common/photo_view_screen.dart';

class GallerySection extends StatelessWidget {
  const GallerySection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      "bankescape",
      "dontdoit",
      "dontdoit2",
      "lightsout",
      "paralyzis",
      "pyrolyzis",
      "rippedapart",
      "theinterference",
      "cheatingdeath",
      "cheatingfate",
      "uniatlas",
      "cuttingboard",
    ];

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        children: [
          const Divider(
            height: 50,
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1,
              crossAxisCount: 4,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemCount: images.length,
            itemBuilder: (context, index) {
              return _imageItem(
                  context, 'assets/projects/${images[index]}.png');
            },
          ),
        ],
      ),
    );
  }

  Widget _imageItem(BuildContext context, String imageUrl) {
    return GestureDetector(
      onTap: () => _showImagePopup(
        context,
        imageUrl,
        '',
      ),
      child: Hero(
        tag: 'heroTag-$imageUrl',
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Image.asset(
            imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  void _showImagePopup(BuildContext context, String imageUrl, String caption) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            width: MediaQuery.of(context).size.height * 0.8,
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(caption),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                    )
                  ],
                ),
                Expanded(child: PhotoViewScreen(imageUrl: imageUrl)),
              ],
            ),
          ),
        );
      },
    );
  }
}
