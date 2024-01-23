import 'package:flutter/material.dart';
import 'package:janiceng_website/common/screensize.dart';
import 'package:janiceng_website/common/section_header.dart';

class AboutMeSection extends StatelessWidget {
  final String content;
  const AboutMeSection({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    var size = ScreenCalculation().getSize(MediaQuery.of(context).size);

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(children: [
        const SectionHeader(label: 'About Me'),
        SizedBox(
          width: MediaQuery.of(context).size.width *
              (size == ScreenSize.large ? 0.5 : 0.9),
          child: const Text(
            'Ever heard of a developer who makes horror games but watches horror movies in utmost terror through the strands of their eyelashes as they squint? Yup, that\'s me. I have 5+ years of experience in indie game development using the Unity Game Engine, and specifically have worked on creating short horror games to publish on Itch.io. My passion springs from transitioning from a player to a creator, wanting to bring my unique narratives to the gaming world. ',
            textAlign: TextAlign.justify,
            style: TextStyle(),
          ),
        ),
      ]),
    );
  }
}
