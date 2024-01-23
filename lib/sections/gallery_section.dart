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
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => PhotoViewScreen(
          imageUrl: imageUrl,
          header: '',
          description: '',
        ),
      )),
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
}
