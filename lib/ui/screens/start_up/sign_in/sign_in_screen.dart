import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';
import 'package:portfolio_app/main.dart';
import 'package:portfolio_app/theme/styels.dart';
import 'package:portfolio_app/theme/themed_text.dart';
import 'package:portfolio_app/ui/screens/start_up/sign_in/sign_in_controller.dart';
import 'package:portfolio_app/ui/widgets/app_logo.dart';
import 'package:portfolio_app/ui/widgets/buttons/common_button.dart';
import 'package:portfolio_app/ui/widgets/start_up_text_field.dart';
import 'package:portfolio_app/utils/app_extention.dart';
import 'package:portfolio_app/utils/spring_curver.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({Key? key}) : super(key: key);
  static const double _logoHeight = 180;
  static const double _contentContainerHeight = 700;
  final SignInController signInController = Get.put(SignInController());

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
                  color: $styles.colors.black,
                ),
              ),
            ],
          )),
      Obx(() {
        return AnimatedSlide(
            offset: Offset(0, signInController.yOffset.value),
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
            children: [
              appStrings.signInTittle.appTittleText(),
              $styles.insets.lg.addHSpace(),
              StartupTextField(
                controller: signInController.emailTextField,
                type: TextInputType.emailAddress,
                label: appStrings.email,
                prefixIcon: Icon(
                  CupertinoIcons.mail,
                  color: $styles.colors.white,
                ),
                validator: (val) {},
              ),
              $styles.insets.lg.addHSpace(),
              StartupTextField(
                controller: signInController.passwordTextField,
                isPassword: true,
                type: TextInputType.visiblePassword,
                label: appStrings.password,
                prefixIcon: Icon(
                  CupertinoIcons.lock,
                  color: $styles.colors.white,
                ),
                validator: (val) {},
              ),
              $styles.insets.lg.addHSpace(),
              AppFieldButton(
                onTap: () {},
                text: appStrings.signInTittle,
              )
            ],
          ).paddingSymmetric(horizontal: $styles.insets.md),
        ),
      ).animate().fadeIn(delay: $styles.times.lazy)
    ]);

    return Scaffold(
      body: DefaultTextColor(
        color: $styles.colors.offWhite,
        child: Container(
          color: $styles.colors.white,
          child: SafeArea(child: content),
        ),
      ),
    );
  }
}
