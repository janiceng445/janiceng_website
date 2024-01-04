import 'package:flutter/material.dart';

class PortfolioSection extends StatelessWidget {
  final List<dynamic> content;
  const PortfolioSection({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: content
            .map((team) => Column(
                  children: [
                    Text(team['company']),
                    Text('Role: ${team['role']}'),
                    Text('Founded: ${team['founded']}'),
                    Text(team['background']),
                    Text(team['link']),
                    ...(team['projects'] as List<dynamic>)
                        .map((project) => Column(
                              children: [
                                Text(project['name']),
                                Text('Published on: ${project['date']}'),
                                Text(project['description']),
                                if (project['features'] != null)
                                  Text('Key features: ${project['features']}'),
                              ],
                            ))
                        .toList(),
                  ],
                ))
            .toList(),
      ),
    );
  }
}
