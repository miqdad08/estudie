import 'package:flutter/material.dart';

import 'app_theme.dart';

class AppDecoration {

  static BoxDecoration get fillBlack => BoxDecoration(
        color: appTheme.black900,
      );
  static BoxDecoration get fillDeepOrange => BoxDecoration(
        color: appTheme.deepOrange300,
      );
  static BoxDecoration get fillDeepPurpleA => BoxDecoration(
        color: appTheme.deepPurpleA700,
      );
  static BoxDecoration get fillErrorContainer => BoxDecoration(
        color: theme.colorScheme.errorContainer,
      );
  static BoxDecoration get fillOnPrimary => BoxDecoration(
        color: theme.colorScheme.onPrimary,
      );

  // Outline decorations
  static BoxDecoration get outlineBlack => BoxDecoration(
        color: theme.colorScheme.errorContainer,
        boxShadow: [
          BoxShadow(
            color: appTheme.black90001.withOpacity(0.07),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(
              0,
              8,
            ),
          ),
        ],
      );
}

class BorderRadiusStyle {
  // Circle borders
  static BorderRadius get circleBorder22 => BorderRadius.circular(
        22,
      );
  static BorderRadius get circleBorder27 => BorderRadius.circular(
        27,
      );
  static BorderRadius get circleBorder35 => BorderRadius.circular(
        35,
      );

  static BorderRadius get customBorderTL12 => const BorderRadius.vertical(
        top: Radius.circular(12),
      );

  static BorderRadius get roundedBorder1 => BorderRadius.circular(
        1,
      );
  static BorderRadius get roundedBorder12 => BorderRadius.circular(
        12,
      );
  static BorderRadius get roundedBorder16 => BorderRadius.circular(
        16,
      );
  static BorderRadius get roundedBorder40 => BorderRadius.circular(
        40,
      );
}

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

