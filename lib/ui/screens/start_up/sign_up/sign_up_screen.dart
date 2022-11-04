import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio_app/theme/styels.dart';
import 'package:portfolio_app/theme/themed_text.dart';
import 'package:portfolio_app/ui/widgets/app_logo.dart';
import 'package:portfolio_app/utils/app_extention.dart';
import 'package:portfolio_app/utils/spring_curver.dart';

import 'sign_up_controller.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);

  static const double _logoHeight = 180;
  static const double _contentContainerHeight = 700;
  final SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    final Widget content = Stack(children: [
      SizedBox(
        height: Get.size.height,
      ),
      IgnorePointer(
          ignoringSemantics: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              $styles.insets.lg.addHSpace(),
              Center(
                child: AppLogo(
                  size: _logoHeight,
                ),
              ),
            ],
          )),
      Obx(() {
        return AnimatedSlide(
            offset: Offset(0, signUpController.yOffset.value),
            duration: $styles.times.lazy,
            curve: const SpringCurve(),
            child: Container(
              height: _contentContainerHeight,
              margin: EdgeInsets.only(
                  top: $styles.insets.lg + _logoHeight + $styles.insets.lg,
                  bottom: 0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft:
                        Radius.circular($styles.corners.startUpBorderRadius),
                    topRight:
                        Radius.circular($styles.corners.startUpBorderRadius)),
                color: $styles.colors.black,
              ),
            ));
      }),
      Container(
        margin: EdgeInsets.only(
          top: $styles.insets.lg +
              _logoHeight +
              $styles.insets.lg +
              $styles.insets.lg,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [],
          ).paddingSymmetric(horizontal: $styles.insets.md),
        ),
      ).animate().fadeIn(delay: $styles.times.lazy)
    ]);

    return Scaffold(
      body: DefaultTextColor(
        color: $styles.colors.offWhite,
        child: Container(
          color: $styles.colors.greyStrong,
          child: SafeArea(child: content),
        ),
      ),
    );
  }
}
