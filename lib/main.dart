import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_app/consts/app_strings.dart';
import 'package:portfolio_app/utils/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Diverse Trends',
      debugShowCheckedModeBanner: false,
      getPages: RouteManager.pages,
      initialRoute: RouteManager.splashScreen,
      // home: IntroScreen(),
    );
  }
}

AppStrings appStrings = AppStrings();
