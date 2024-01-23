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
          Text(
            'Hi, I\'m Janice and I like making games.',
            style: TextStyle(
              fontSize: size == ScreenSize.large ? 36 : 32,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'Welcome to my portfolio',
            style: TextStyle(
              fontSize: size == ScreenSize.large ? 24 : 20,
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
                        dayProfileDescription, 20, size),
                    Container(
                      color: Colors.white,
                      width: 5,
                      height: 100,
                    ),
                    _profile(Icons.mode_night, nightProfileLabel,
                        nightProfileDescription, 20, size),
                  ],
                )
              : Column(
                  children: [
                    _profile(Icons.sunny, dayProfileLabel,
                        dayProfileDescription, 18, size),
                    _profile(Icons.mode_night, nightProfileLabel,
                        nightProfileDescription, 18, size),
                  ],
                )
        ],
      ),
    );
  }

  Widget _profile(
      IconData icon, heading, String content, double padding, ScreenSize size) {
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
            width: size == ScreenSize.large ? 300 : 250,
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
