import 'package:flutter/material.dart';

abstract class AppColors {
  AppColors._();

  static const Color pink = Color(0xffE10872);
  static const Color primary = Color(0xff2B2B2B);
  static const Color cyan = Color(0xff2BE3FF);
}

abstract class LightAppColors {
  LightAppColors._();

  static const Color primary = Color(0xff2B2B2B);
  static const Color background = Color(0xffEDEDED);
  static const Color secondaryBackground = Color(0xffFFFFFF);
  static const Color textColor = Color(0xff000000);
  static const Color secondaryTextColor = Color(0xff000000);
  static const Color sweetGrey = Color(0xffD9D9D9);
}

abstract class DarkAppColors {
  DarkAppColors._();

  static const Color primary = Color(0xff2BE3FF);
  static const Color background = Color(0xff000000);
  static const Color secondaryBackground = Color(0xff161616);
  static const Color textColor = Color(0xffFFFFFF);
  static const Color secondaryTextColor = Color(0xffEDEDED);
}

abstract class DynamicColors {
  DynamicColors._();

  static Color getColor(
    BuildContext context, {
    required Color light,
    required Color dark,
  }) {
    return Theme.of(context).brightness == Brightness.light ? light : dark;
  }

  static Color background(BuildContext context) {
    return getColor(
      context,
      light: LightAppColors.background,
      dark: DarkAppColors.background,
    );
  }

  static Color secondaryBackground(BuildContext context) {
    return getColor(
      context,
      light: LightAppColors.secondaryBackground,
      dark: DarkAppColors.secondaryBackground,
    );
  }

  static Color primary(BuildContext context) {
    return getColor(
      context,
      light: LightAppColors.primary,
      dark: DarkAppColors.primary,
    );
  }

  static Color textColor(BuildContext context) {
    return getColor(
      context,
      light: LightAppColors.textColor,
      dark: DarkAppColors.textColor,
    );
  }

  static Color secondaryTextColor(BuildContext context) {
    return getColor(
      context,
      light: LightAppColors.secondaryTextColor,
      dark: DarkAppColors.secondaryTextColor,
    );
  }

  static Color sweetGrey(BuildContext context) {
    return getColor(
      context,
      light: LightAppColors.sweetGrey,
      dark: DarkAppColors.background,
    );
  }
}
