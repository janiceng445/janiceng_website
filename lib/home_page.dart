import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:janiceng_website/sections/about_me_section.dart';
import 'package:janiceng_website/sections/intro_section.dart';
import 'package:janiceng_website/sections/portfolio_section.dart';
import 'package:janiceng_website/sections/work_experience_section.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: _loadContentData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                var data = snapshot.data;
                return Container(
                  child: Column(
                    children: [
                      IntroSection(content: data!['intro']),
                      AboutMeSection(
                        content: data['aboutme'],
                      ),
                      PortfolioSection(content: data['portfolio']),
                      WorkExperienceSection(content: data['work']),
                    ],
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            }),
      ),
    );
  }

  Future<Map<String, dynamic>> _loadContentData() async {
    String data = await rootBundle.loadString('lib/content.json');
    return jsonDecode(data);
  }
}
