import 'package:breakdown_assistant/base/themes/theme_helper.dart';
import 'package:flutter/material.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBackground => BoxDecoration(
    color: theme.colorScheme.background,
  );
  static BoxDecoration get fillGray => BoxDecoration(
    color: appTheme.gray5001,
  );
  static BoxDecoration get fillPrimary => BoxDecoration(
    color: theme.colorScheme.primary,
  );
  static BoxDecoration get fillWhiteA => BoxDecoration(
    color: appTheme.whiteA700,
  );

  static BoxDecoration get outlineBlack => BoxDecoration(
    color: appTheme.gray5001,
    border: Border.all(
      color: appTheme.black900,
      width: 1,
    ),
  );

  static BoxDecoration get outlineGray => BoxDecoration(
    color: appTheme.gray5001,
    border: Border.all(
      color: appTheme.gray300,
      width: 1,
    ),
  );

  static BoxDecoration get outlineGray300 => BoxDecoration(
    color: appTheme.gray50,
  );

  static BoxDecoration get outlineGray3001 => BoxDecoration(
    color: appTheme.whiteA700,
  );
}

class BorderRadiusStyle {
  // Custom borders
  static BorderRadius get customBorderTL42 => BorderRadius.only(
    topLeft: Radius.circular(42),
    topRight: Radius.circular(41),
    bottomLeft: Radius.circular(42),
    bottomRight: Radius.circular(41),
  );
  static BorderRadius get roundedBorder17 => BorderRadius.circular(
    17,
  );
  static BorderRadius get roundedBorder20 => BorderRadius.circular(
    20,
  );
}


double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;
