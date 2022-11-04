import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_app/consts/assets.dart';
import 'package:portfolio_app/theme/styels.dart';
import 'package:portfolio_app/utils/route_manager.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      RouteManager.navigate(RouteManager.introScreen);
    });
    return Scaffold(
      body: Container(
          width: Get.size.width,
          color: $styles.colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ExcludeSemantics(
                child: Image.asset(ImagePaths.appTransparentLogo,
                    color: $styles.colors.offWhite, height: 300),
              ),
            ],
          )),
    );
  }
}
