import 'package:breakdown_assistant/base/themes/theme_helper.dart';
import 'package:flutter/material.dart';

class CustomTextStyles {
  // Title text style
  static get titleLargeBlack900 => theme.textTheme.titleLarge!.copyWith(
    color: appTheme.black900,
  );
  static get titleLargeWhite => theme.textTheme.titleLarge!.copyWith(
    color: appTheme.white,
  );
  static get titleLargeInterGray40001 =>
      theme.textTheme.titleLarge!.inter.copyWith(
        color: appTheme.gray40001,
        fontWeight: FontWeight.w600,
      );
  static get titleLargeInterOnPrimary =>
      theme.textTheme.titleLarge!.inter.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get titleLargeInterOnPrimaryContainer =>
      theme.textTheme.titleLarge!.inter.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w600,
      );
  static get titleLargePrimary => theme.textTheme.titleLarge!.copyWith(
    color: theme.colorScheme.primary,
  );
}

extension on TextStyle {
  TextStyle get nunito {
    return copyWith(
      fontFamily: 'Nunito',
    );
  }

  TextStyle get inter {
    return copyWith(
      fontFamily: 'Inter',
    );
  }
}