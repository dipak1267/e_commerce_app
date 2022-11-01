import 'package:flutter/cupertino.dart';

extension SizeBoxes on num {
  addHSpace() {
    return SizedBox(
      height: toDouble(),
    );
  }

  addWSpace() {
    return SizedBox(
      width: toDouble(),
    );
  }

  addSpace() {
    return SizedBox(
      height: toDouble(),
      width: toDouble(),
    );
  }
}
