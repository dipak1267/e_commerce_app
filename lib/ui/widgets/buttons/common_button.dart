import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:portfolio_app/theme/styels.dart';

class AppFieldButton extends StatelessWidget {
  const AppFieldButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);
  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.size.width,
      height: 42,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all($styles.colors.accent1),
          shadowColor: MaterialStateProperty.all($styles.colors.accent1),
          elevation: MaterialStateProperty.all(5),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular($styles.corners.md),
          )),
        ),
        onPressed: () {
          onTap();
        },
        child: Text(
          text,
          style:
              $styles.text.defaultFont.copyWith(color: $styles.colors.offWhite),
        ),
      ),
    );
  }
}

class AppOutlinedButton extends StatelessWidget {
  const AppOutlinedButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
