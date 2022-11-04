import 'package:flutter/material.dart';
import 'package:portfolio_app/theme/styels.dart';

TextStyle textFieldLabelStyle() {
  return TextStyle(
      color: Colors.white.withOpacity(0.5),
      fontSize: 16,
      fontWeight: FontWeight.w400);
}

OutlineInputBorder startupTextFieldBorder() {
  return OutlineInputBorder(
      borderRadius:
          BorderRadius.circular($styles.corners.textFieldBorderRadius),
      borderSide: const BorderSide(color: Color(0xFF474747)));
}
