import 'package:flutter/material.dart';
import 'package:portfolio_app/consts/assets.dart';
import 'package:portfolio_app/theme/styels.dart';

class AppLogo extends StatelessWidget {
  AppLogo({super.key, this.size});
  double? size = 120;
  @override
  Widget build(BuildContext context) {
    return ExcludeSemantics(
      child: Image.asset(ImagePaths.appTransparentLogo,
          color: $styles.colors.offWhite, height: size),
    );
  }
}
