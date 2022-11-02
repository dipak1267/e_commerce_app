import 'package:flutter/cupertino.dart';
import 'package:portfolio_app/theme/styels.dart';

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

extension AppTexts on String {
  Text appTittleText() {
    return Text(
      this,
      style: $styles.text.copy($styles.text.defaultFont,
          sizePx: 24, weight: FontWeight.w600, heightPx: 27),
      textAlign: TextAlign.center,
    );
  }

  Text appBodyText() {
    return Text(
      this,
      style: $styles.text.copy($styles.text.defaultFont,
          sizePx: 14, weight: FontWeight.w400, heightPx: 27),
      textAlign: TextAlign.center,
    );
  }

  Text appButtonText() {
    return Text(
      this,
      style:
          $styles.text.copy($styles.text.defaultFont, sizePx: 14, heightPx: 23),
      textAlign: TextAlign.center,
    );
  }

  Text appBodySmallText() {
    return Text(
      this,
      style:
          $styles.text.copy($styles.text.defaultFont, sizePx: 14, heightPx: 23),
      textAlign: TextAlign.center,
    );
  }
}
