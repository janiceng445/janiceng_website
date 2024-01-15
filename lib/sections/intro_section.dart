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
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Hi, I\'m Janice and I like making games.',
            style: TextStyle(
              fontSize: 36,
            ),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _profile(Icons.sunny, 'Worker profile',
                  'A data scientist, navigating the realm of insurance and helping AI to detect fraud.'),
              Container(
                color: Colors.white,
                width: 5,
                height: 100,
              ),
              _profile(Icons.mode_night, 'Personal profile',
                  'A casual gamer (secretly competitive), indie game developer, chef, and artist.'),
            ],
          )
        ],
      ),
    );
  }

  Widget _profile(IconData icon, heading, String content) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
