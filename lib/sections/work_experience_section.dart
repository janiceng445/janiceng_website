import 'package:flutter/material.dart';
import 'package:janiceng_website/common/diagonal_clipper.dart';
import 'package:janiceng_website/common/section_header.dart';

class WorkExperienceSection extends StatelessWidget {
  final List<dynamic> content;
  const WorkExperienceSection({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          const SectionHeader(label: 'Work Experiences'),
          const SizedBox(
            height: 20,
          ),
          _introParagraph(context),
          Container(
            color: Colors.white,
            height: 250,
            child: Flex(
              direction: Axis.horizontal,
              children: [
                _workSection(
                    context,
                    'iRemedy Healthcare, Inc.',
                    'Technical Support Assistant',
                    'Published content pages on the Magneto platform, designed and implemented WordPress sites from wireframes using HTML/CSS, and produced mockups and prototype interfaces for new web apps with Balsamiq.',
                    ['Magento, HTML, CSS, Balsamiq'],
                    const Color(0xFF1663A0),
                    DiagonalClipperAlignment.left),
                _workSection(
                    context,
                    'Epic Systems Corporation',
                    'Software Developer',
                    'Lead developer of MyChart Care Companion Education feature that holds a compilation of educational documents, notes, audio, video, and more for inpatient and/or outpatient users to learn about their procedures, diagnosis, treatment care plans, etc. Developed data models and translations for XML schema imports to provide a user-friendly tool for 3rd party vendors.',
                    ['C#', 'M (MUMPS)', 'React', 'SASS', 'XML Schema'],
                    const Color(0xFF66001A),
                    DiagonalClipperAlignment.center),
                _workSection(
                    context,
                    'Shift Technologies',
                    'Senior Data Scientist',
                    'Implemented innovative scenarios to enhance AI detection of fraudulent claims in motor and healthcare lines of business. Conducted SQL database operations, tailored UI modifications as per client requests, and integrated ElasticSearch for an advanced search experience.',
                    ['C#', 'SQL', 'ElasticSearch'],
                    const Color(0xFF5134C9),
                    DiagonalClipperAlignment.right),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _introParagraph(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: const Column(
        children: [
          Text(
            '“Classic misdirection”',
            style: TextStyle(
              fontSize: 22,
              fontStyle: FontStyle.italic,
            ),
          ),
          Text(
            '- Leblanc (League of Legends)',
            style: TextStyle(
              fontSize: 12,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'This quote perfectly mirrors my personal journey to becoming a game developer--a path that, much like many others, took an indirect route. The start of my career took place at Burger King, working in the back assembling burgers. It wasn\'t until later that I took my first stride into the tech industry, where I\'ve been steadily accumulating expertise in software development. In parallel, to best align my passion with game development, I took the initiative to self-learn how to create 3D games with Unity.',
            textAlign: TextAlign.justify,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
              'Below are the job title milestones that significantly contributed to my learning journey:'),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget _workSection(
      BuildContext context,
      String company,
      String role,
      String description,
      List<String> skills,
      Color backgroundColor,
      DiagonalClipperAlignment alignment) {
    return Expanded(
      flex: 1,
      child: ClipPath(
        clipper: DiagonalClipper(alignment: alignment, steepness: 3),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
          color: backgroundColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                company,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                role,
                style: const TextStyle(
                  fontSize: 22,
                ),
              ),
              Text(description),
              const Spacer(),
              Text('Skills: ${skills.join(', ')}')
            ],
          ),
        ),
      ),
    );
  }

  /*
Container(
        child: Column(
      children: content
          .map((work) => Column(
                children: [
                  Text(work['company']),
                  Text(work['description']),
                  Text('Year: ${work['year']}'),
                  Text('Technologies: ${work['technologies']}'),
                  Text('Role: ${work['role']}'),
                ],
              ))
          .toList(),
    ))

  */
}
