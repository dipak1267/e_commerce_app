import 'package:flutter/material.dart';
import 'package:portfolio_app/consts/app_strings.dart';
import 'package:portfolio_app/ui/screens/intro/intro_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Diverse Trends',
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
    );
  }
}

AppStrings appStrings = AppStrings();
