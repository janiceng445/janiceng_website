import 'package:flutter/material.dart';
import 'package:janiceng_website/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Janice Ng',
      theme: ThemeData(
        textTheme: const TextTheme(
                bodySmall: TextStyle(),
                bodyMedium: TextStyle(),
                bodyLarge: TextStyle())
            .apply(
          bodyColor: Colors.white,
          displayColor: Colors.white,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple, background: Colors.black),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
