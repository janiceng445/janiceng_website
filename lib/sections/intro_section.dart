import 'package:flutter/material.dart';
import 'package:janiceng_website/common/screensize.dart';

class IntroSection extends StatelessWidget {
  final String content;
  const IntroSection({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    var size = ScreenCalculation().getSize(MediaQuery.of(context).size);

    var dayProfileLabel = 'Worker profile';
    var nightProfileLabel = 'Personal profile';
    var dayProfileDescription =
        'A data scientist, navigating the realm of insurance and helping AI to detect fraud.';
    var nightProfileDescription =
        'A casual gamer (secretly competitive), indie game developer, chef, and artist.';

    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.8,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Hi, I\'m Janice and I like making games.',
            style: TextStyle(
              fontSize: 36,
            ),
            textAlign: TextAlign.center,
          ),
          const Text(
            'Welcome to my portfolio',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          size == ScreenSize.large
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _profile(Icons.sunny, dayProfileLabel,
                        dayProfileDescription, 20),
                    Container(
                      color: Colors.white,
                      width: 5,
                      height: 100,
                    ),
                    _profile(Icons.mode_night, nightProfileLabel,
                        nightProfileDescription, 20),
                  ],
                )
              : Column(
                  children: [
                    _profile(Icons.sunny, dayProfileLabel,
                        dayProfileDescription, 18),
                    _profile(Icons.mode_night, nightProfileLabel,
                        nightProfileDescription, 18),
                  ],
                )
        ],
      ),
    );
  }

  Widget _profile(IconData icon, heading, String content, double padding) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: padding),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
            ),
            height: 64,
            width: 64,
            child: Icon(icon),
          ),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
            width: 300,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(heading),
                Text(content),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
