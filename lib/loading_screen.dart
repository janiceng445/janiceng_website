import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        height: MediaQuery.of(context).size.height,
        child: const Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Loading system components...'),
                Text('Checking system integrity...'),
                Divider(),
                Text('Booting up janiceng_portfolio_website.exe'),
                Text('Searching for art assets...'),
                Text('13 skills found.'),
                Text('Loading skills, please wait. This might take 3 seconds.'),
                Text('Loading gamer hat'),
                Text('Loading game developer hat'),
                Text('Loading chef hat'),
                Text('Loading art assets complete.'),
                Divider(),
                Text('Completing system initialization...'),
                Divider(),
                Text('System boot-up completed successfully.'),
                Text('Welcome to Janice Ng\'s Portfolio Version 1.0!'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
