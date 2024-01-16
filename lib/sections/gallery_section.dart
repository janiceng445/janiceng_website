import 'package:flutter/material.dart';
import 'package:janiceng_website/common/photo_view_screen.dart';
import 'package:janiceng_website/common/screensize.dart';

class GallerySection extends StatelessWidget {
  const GallerySection({super.key});

  @override
  Widget build(BuildContext context) {
    var size = ScreenCalculation().getSize(MediaQuery.of(context).size);
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
      width: MediaQuery.of(context).size.width *
          (size == ScreenSize.large ? 0.5 : 0.9),
      child: Column(
        children: [
          const Divider(
            height: 50,
          ),
          GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 1,
              crossAxisCount: (size == ScreenSize.large ? 4 : 3),
              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemCount: images.length,
            itemBuilder: (context, index) {
              return _imageItem(
                context,
                'assets/projects/${images[index]}.png',
                size,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _imageItem(BuildContext context, String imageUrl, ScreenSize size) {
    return GestureDetector(
      onTap: () => _showImagePopup(
        context,
        imageUrl,
        '',
        size,
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

  void _showImagePopup(
      BuildContext context, String imageUrl, String caption, ScreenSize size) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            width: MediaQuery.of(context).size.height * 0.9,
            height: MediaQuery.of(context).size.height *
                (size == ScreenSize.large ? 0.5 : 0.2),
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
