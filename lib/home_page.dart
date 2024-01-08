import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:janiceng_website/sections/about_me_section.dart';
import 'package:janiceng_website/sections/intro_section.dart';
import 'package:janiceng_website/loading_screen.dart';
import 'package:janiceng_website/sections/projects_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Map<String, dynamic> _data = {};

  /*double rateZero = 0;
  double rateOne = 0;
  double rateTwo = 0;
  double rateThree = 0;
  double rateFour = 0;
  double rateFive = 0;
  double rateSix = 0;
  double rateSeven = 0;
  double rateEight = 0;
  String asset = "";
  double top = 0;*/

  @override
  void initState() {
    super.initState();
    _loadContents();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            IntroSection(content: 'content'),
            AboutMeSection(content: 'content'),
            ProjectsSection(),
          ],
        ),
      ),
    );
    return _data.isNotEmpty
        ? Scaffold(
            body: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [
                    IntroSection(content: _data['intro']),
                    // AboutMeSection(
                    //   content: _data['aboutme'],
                    // ),
                    // PortfolioSection(content: _data['portfolio']),
                    // WorkExperienceSection(content: _data['work']),
                  ],
                ),
              ),
            ),
          )
        : const LoadingScreen();
  }

  // Not used right now
  /*Widget _bodyParallax() {
    return NotificationListener<ScrollNotification>(
      onNotification: (v) {
        if (v is ScrollUpdateNotification) {
          setState(() {
            rateEight -= v.scrollDelta! / 1;
            rateSeven -= v.scrollDelta! / 1.5;
            rateSix -= v.scrollDelta! / 2;
            rateFive -= v.scrollDelta! / 2.5;
            rateFour -= v.scrollDelta! / 3;
            rateThree -= v.scrollDelta! / 3.5;
            rateTwo -= v.scrollDelta! / 4;
            rateOne -= v.scrollDelta! / 4.5;
            rateZero -= v.scrollDelta! / 5;
          });
        }
        return false;
      },
      child: Stack(
        children: [
          ParallaxWidget(top: rateZero, asset: 'parallax0'),
          ParallaxWidget(top: rateOne, asset: 'parallax1'),
          ParallaxWidget(top: rateTwo, asset: 'parallax2'),
          ParallaxWidget(top: rateThree, asset: 'parallax3'),
          ParallaxWidget(top: rateFour, asset: 'parallax4'),
          ParallaxWidget(top: rateFive, asset: 'parallax5'),
          ParallaxWidget(top: rateSix, asset: 'parallax6'),
          ParallaxWidget(top: rateSeven, asset: 'parallax7'),
          ParallaxWidget(top: rateEight, asset: 'parallax8'),
          ListView(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                color: Colors.transparent,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 70),
                color: const Color(0xff210002),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IntroSection(content: _data['intro']),
                    AboutMeSection(
                      content: _data['aboutme'],
                    ),
                    PortfolioSection(content: _data['portfolio']),
                    WorkExperienceSection(content: _data['work']),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }*/

  void _loadContents() {
    Future.delayed(const Duration(seconds: 2), () async {
      String data = await rootBundle.loadString('assets/content.json');
      setState(() {
        _data = jsonDecode(data);
      });
    });
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
