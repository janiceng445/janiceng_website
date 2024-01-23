import 'package:flutter/material.dart';
import 'package:janiceng_website/sections/about_me_section.dart';
import 'package:janiceng_website/sections/footer_section.dart';
import 'package:janiceng_website/sections/gallery_section.dart';
import 'package:janiceng_website/sections/intro_section.dart';
import 'package:janiceng_website/sections/projects_section.dart';
import 'package:janiceng_website/sections/work_experience_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IntroSection(content: 'content'),
                AboutMeSection(content: 'content'),
                WorkExperienceSection(content: []),
                ProjectsSection(),
                GallerySection(),
                FooterSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ParallaxWidget extends StatelessWidget {
  const ParallaxWidget({
    super.key,
    required this.top,
    required this.asset,
  });

  final double top;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: top,
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Image.asset(
          'assets/$asset.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
