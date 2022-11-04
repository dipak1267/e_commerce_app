// ignore_for_file: library_private_types_in_public_api

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio_app/theme/colors.dart';

final $styles = AppStyle();

@immutable
class AppStyle {
  /// The current theme colors for the app
  final AppColors colors = AppColors();

  /// Rounded edge corner radii
  late final _Corners corners = _Corners();

  late final _Shadows shadows = _Shadows();

  /// Padding and margin values
  late final _Insets insets = _Insets();

  /// Text styles
  late final _Text text = _Text();

  /// Animation Durations
  final _Times times = _Times();
}

@immutable
class _Times {
  final Duration fast = const Duration(milliseconds: 300);
  final Duration med = const Duration(milliseconds: 600);
  final Duration slow = const Duration(milliseconds: 900);
  final Duration lazy = const Duration(milliseconds: 1500);
  final Duration pageTransition = const Duration(milliseconds: 200);
}

@immutable
class _Corners {
  late final double sm = 4;
  late final double md = 8;
  late final double lg = 32;

  late final double textFieldBorderRadius = 15;
  late final double startUpBorderRadius = 32;
}

@immutable
class _Insets {
  late final double xxs = 4;
  late final double xs = 8;
  late final double sm = 16;
  late final double md = 24;
  late final double lg = 32;
  late final double xl = 48;
  late final double xxl = 56;
  late final double offset = 80;
}

@immutable
class _Shadows {
  final textSoft = [
    Shadow(
        color: Colors.black.withOpacity(.25),
        offset: const Offset(0, 2),
        blurRadius: 4),
  ];
  final text = [
    Shadow(
        color: Colors.black.withOpacity(.6),
        offset: const Offset(0, 2),
        blurRadius: 2),
  ];
  final textStrong = [
    Shadow(
        color: Colors.black.withOpacity(.6),
        offset: const Offset(0, 4),
        blurRadius: 6),
  ];
}

@immutable
class _Text {
  TextStyle appTextStyle() {
    return GoogleFonts.readexPro();
  }

  TextStyle get titleFont => appTextStyle().copyWith(fontFeatures: const [
        FontFeature.enable('dlig'),
        FontFeature.enable('kern'),
      ]);

  TextStyle get defaultFont => appTextStyle();
  TextStyle get contentFont => appTextStyle();

  TextStyle copy(TextStyle style,
      {required double sizePx,
      double? heightPx,
      double? spacingPc,
      FontWeight? weight}) {
    return style.copyWith(
        fontSize: sizePx,
        height: heightPx != null ? (heightPx / sizePx) : style.height,
        letterSpacing:
            spacingPc != null ? sizePx * spacingPc * 0.01 : style.letterSpacing,
        fontWeight: weight);
  }
}
