import 'package:flutter/material.dart';
import 'package:janiceng_website/common/app_colors.dart';
import 'package:janiceng_website/common/section_header.dart';

class AboutMeSection extends StatelessWidget {
  final String content;
  const AboutMeSection({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: AppColors.secondaryBackgroundColor,
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(children: [
        const SectionHeader(label: 'About Me'),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: const Text(
            'Greetings! I am a gamer and develop games. Lots of horror games to be exact. I\'m also a huge chicken, so most horror content is seen between the strands of my eyelashes as I squint. The combination surely makes it all the more interesting. I have 5+ years of experience in indie game development with the Unity Game Engine and still continuing to learn! My passion springs from transitioning from a player to a creator, wanting to bring my unique narratives to the gaming world.',
            textAlign: TextAlign.justify,
            style: TextStyle(),
          ),
        ),
      ]),
    );
  }
}
