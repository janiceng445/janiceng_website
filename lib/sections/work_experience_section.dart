import 'package:flutter/material.dart';

class WorkExperienceSection extends StatelessWidget {
  final List<dynamic> content;
  const WorkExperienceSection({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    ));
  }
}
