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
  Text appTittleText({double sizePx = 24, double heightPx = 27}) {
    return Text(
      this,
      style: $styles.text.copy($styles.text.defaultFont,
          sizePx: sizePx, weight: FontWeight.w600, heightPx: heightPx),
      textAlign: TextAlign.center,
    );
  }

  Text appBodyText({double sizePx = 14, double heightPx = 27}) {
    return Text(
      this,
      style: $styles.text.copy($styles.text.defaultFont,
          sizePx: sizePx, weight: FontWeight.w400, heightPx: heightPx),
      textAlign: TextAlign.center,
    );
  }

  Text appButtonText({double sizePx = 14, double heightPx = 23}) {
    return Text(
      this,
      style: $styles.text
          .copy($styles.text.defaultFont, sizePx: sizePx, heightPx: heightPx),
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
