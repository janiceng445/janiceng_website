import 'package:flutter/material.dart';
import 'package:janiceng_website/common/screensize.dart';
import 'package:janiceng_website/common/section_header.dart';
import 'package:url_launcher/url_launcher.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var size = ScreenCalculation().getSize(MediaQuery.of(context).size);

    return Container(
      margin:
          EdgeInsets.symmetric(vertical: (size == ScreenSize.large ? 50 : 10)),
      width: MediaQuery.of(context).size.width *
          (size == ScreenSize.large ? 0.5 : 0.9),
      child: Column(
        children: [
          const SectionHeader(label: 'Personal Projects'),
          const Divider(
            height: 50,
          ),
          _projectTeam(
            'JNSquared',
            'Co-developer of a small indie game development team with 8 published titles on itch.io. Three games have ranked #1 on Top Popular Horror Games category on the platform as well as garnered playthroughs by famous YouTubers with over millions of views. Additionally participated in Game Jams under this name.',
            'jnsquared',
            size,
            belowImage: InkWell(
                child: const Text('Link to itch.io'),
                onTap: () =>
                    _launchExternalLink('https://jn-squared.itch.io/')),
          ),
          _projectTeam(
            'Night Forge',
            'Co-developer of a small indie game development team with 4 published titles with direct contribution. Two games ranked within top 10 in Popular Horror Games category on itch.io. Attributed as the first inaugural step to game development in Unity Game Engine.',
            'nightforge',
            size,
            belowImage: InkWell(
                child: const Text('Link to itch.io'),
                onTap: () =>
                    _launchExternalLink('https://nightforge.itch.io/')),
          ),
          _projectTeam(
            'UniAtlas',
            'Lead developer of a user-friendly AR mobile app that provides self-guided tours and indoor navigation for users to navigate large campuses. One of the 7 finalists to the University of Central Florida\'s UTVS (UCF Technology Venture Symposium Pitch Competition) of 2022.',
            'uniatlas',
            size,
          ),
          _projectTeam(
            'CuttingBoard',
            'Lead developer of an AR mobile app aiming to empower home cooks of all levels to perfect their skills in a safe and controlled environment using revolutionary technology. Achieved semifinalist of UCF\'s Joust pitch competition of 2023.',
            'cuttingboard',
            size,
          ),
          _projectTeam(
            'JingAnvil',
            'When I\'m not working on games with others, I implement common scripts I tend to use in games within a playground. These scripts have become a useful toolkit for various game projects, saving us from redoing a lot of work. JingAnvil stands apart from my previous collaborations, serving as a set of ready-to-use tools that seamlessly integrate into future games, expediting the process. Releases under this name validate the usability of the scripts.',
            'jinganvil',
            size,
          )
        ],
      ),
    );
  }

  Future<void> _launchExternalLink(String url) async {
    final link = Uri.parse(url);
    if (!await launchUrl(link, mode: LaunchMode.externalApplication)) {
      // <--
      throw Exception('Could not launch $link');
    }
  }

  Widget _projectTeam(
      String name, String description, String? imageUrl, ScreenSize size,
      {Widget? belowImage}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: size == ScreenSize.large
          ? Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    if (belowImage != null) ...[
                      const SizedBox(
                        height: 10,
                      ),
                      belowImage
                    ],
                  ],
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
            )
          : Column(
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
                if (belowImage != null) ...[
                  const SizedBox(
                    height: 10,
                  ),
                  belowImage
                ],
                const SizedBox(
                  width: 20,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  description,
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
    );
  }
}
