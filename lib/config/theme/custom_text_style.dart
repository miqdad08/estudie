import 'package:flutter/material.dart';
import 'app_theme.dart';

class CustomTextStyles {
  // Headline text style
  static get headlineSmallOnPrimaryContainer =>
      theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontWeight: FontWeight.w700,
      );

  // Label text style
  static get labelLargeOnPrimary => theme.textTheme.labelLarge!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w600,
      );

  static get labelLargeSemiBold => theme.textTheme.labelLarge!.copyWith(
        fontWeight: FontWeight.w600,
      );

  // Poppins text style
  static get poppinsOnPrimaryContainer => TextStyle(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontSize: 60,
        fontWeight: FontWeight.w900,
        height: 1,
      ).poppins;

  static get poppinsOnPrimaryContainer50 => TextStyle(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontSize: 50,
        fontWeight: FontWeight.w900,
        height: 1,
      ).poppins;

  static get poppinsOnPrimaryContainer30 => TextStyle(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontSize: 40,
        fontWeight: FontWeight.w900,
        height: 1,
      ).poppins;

  static get poppinsOnPrimaryContainerBlack => TextStyle(
        color: theme.colorScheme.onPrimaryContainer.withOpacity(1),
        fontSize: 66,
        fontWeight: FontWeight.w900,
        height: 1,
        letterSpacing: 1.0,
      ).poppins;

  static get poppinsPrimaryContainer => TextStyle(
          color: theme.colorScheme.primaryContainer,
          fontSize: 60,
          fontWeight: FontWeight.w900,
          height: 1,
          letterSpacing: 1.0)
      .poppins;

  static get poppinsPrimaryContainer50 => TextStyle(
          color: theme.colorScheme.primaryContainer,
          fontSize: 50,
          fontWeight: FontWeight.w900,
          height: 1,
          letterSpacing: 1.0)
      .poppins;

  static get poppinsPrimaryContainer30 => TextStyle(
          color: theme.colorScheme.primaryContainer,
          fontSize: 40,
          fontWeight: FontWeight.w900,
          height: 1,
          letterSpacing: 1.0)
      .poppins;

  // Title text style
  static get titleMedium18 => theme.textTheme.titleMedium!.copyWith(
        fontSize: 18,
      );

  static get titleMediumBold => theme.textTheme.titleMedium!.copyWith(
        fontWeight: FontWeight.w700,
      );
}

extension on TextStyle {
  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
}
