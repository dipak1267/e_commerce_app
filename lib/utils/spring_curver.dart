import 'dart:math';

import 'package:flutter/material.dart';

class SpringCurve extends Curve {
  const SpringCurve({
    this.a = 0.15,
    this.w = 4,
    this.handleNegative = false,
  });
  final double a;
  final double w;
  final bool handleNegative;

  @override
  double transformInternal(double t) {
    double value = -(pow(e, -t / a) * cos(t * w)) + 1;

    return value < 0
        ? handleNegative
            ? 0
            : value
        : value;
  }
}
