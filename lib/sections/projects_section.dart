import 'package:flutter/material.dart';
import 'package:janiceng_website/common/section_header.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 50),
      width: MediaQuery.of(context).size.width * 0.5,
      child: Column(
        children: [
          const SectionHeader(label: 'Personal Projects'),
          _projectTeam(
              'JNSquared',
              'Co-developer of a small indie game development team with 8 published titles on itch.io. Three games have ranked #1 on Top Popular Horror Games category on the platform as well as garnered playthroughs by famous YouTubers with over millions of views. Additionally participated in Game Jams under this name.',
              'jnsquared'),
          _projectTeam(
              'Jang Games',
              'Co-developer of a small indie game development team with 2 published titles with direct contribution. Both games ranked within top 10 in Popular Horror Games category on itch.io. Attributed as the first inaugural step to game development in Unity Game Engine.',
              'janggames'),
          _projectTeam(
              'UniAtlas',
              'Lead developer of an user-friendly AR mobile app that provides self-guided tours and indoor navigation for users to navigate large campuses. One of the 7 finalists to the University of Central Florida\'s UTVS (UCF Technology Venture Symposium Pitch Competition) of 2022.',
              'uniatlas'),
          _projectTeam(
              'CuttingBoard',
              'Lead developer of an AR mobile app aiming to empower home cooks of all levels to perfect their skills in a safe and controlled environment using revolutionary technology. Achieved semifinalist of UCF\'s Joust pitch competition of 2023.',
              'cuttingboard'),
          _projectTeam(
              'JingAnvil',
              'When I\'m not working on games with others, I implement common scripts I tend to use in games within a playground. These scripts have become a useful toolkit for various game projects, saving us from redoing a lot of work. JingAnvil stands apart from my previous collaborations, serving as a set of ready-to-use tools that seamlessly integrate into future games, expediting the process. Releases under this name validate the usability of the scripts.',
              'jinganvil')
        ],
      ),
    );
  }

  Widget _projectTeam(String name, String description, String? imageUrl) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Container(
            height: 128,
            width: 128,
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Colors.white,
              ),
              shape: BoxShape.circle,
              image: DecorationImage(
                image: Image.asset(
                  'assets/teams/$imageUrl.png',
                ).image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  description,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
