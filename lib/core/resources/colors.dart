import 'package:flutter/material.dart';

abstract class AppColors {
  AppColors._();

  static const Color pink = Color(0xffE10872);
  static const Color primary = Color(0xff2B2B2B);
  static const Color cyan = Color(0xff2BE3FF);
  static const Color offWhite = Color(0xffEDEDED);
  static const Color placeHolder = Color(0xffE4E4E4);
  static const Color gray = Color(0xff606060);
}

abstract class LightAppColors {
  LightAppColors._();

  static const Color primary = Color(0xff2B2B2B);
  static const Color background = Color(0xffEDEDED);
  static const Color secondaryBackground = Color(0xffFFFFFF);
  static const Color textColor = Color(0xff000000);
  static const Color secondaryTextColor = Color(0xff000000);
  static const Color sweetGrey = Color(0xffD9D9D9);
  static const Color primaryPlaceHolder = Color(0xffD9D9D9);
  static const Color placeHolder = Color(0xffE4E4E4);
  static const Color card = Color(0xffFFFFFF);
  static const Color border = Color(0xffD9D9D9);
  static const Color cardBackground = Color(0xffFFFFFF);
  static const Color card2 = Color(0xffEDEDED);
  static const Color card3 = Color(0xffFFFFFF);
  static const Color surfaceGrey = Color(0xffD9D9D9);
  static const Color actionBorder = Color(0xff000000);
}

abstract class DarkAppColors {
  DarkAppColors._();

  static const Color primary = Color(0xff2BE3FF);
  static const Color background = Color(0xff000000);
  static const Color secondaryBackground = Color(0xff161616);
  static const Color textColor = Color(0xffFFFFFF);
  static const Color secondaryTextColor = Color(0xffEDEDED);
  static const Color primaryPlaceHolder = Color(0xff161616);
  static const Color placeHolder = Color(0xff2B2B2B);
  static const Color card = Color(0xff000000);
  static const Color border = Color(0xff2B2B2B);
  static const Color cardBackground = Color(0xff2B2B2B);
  static const Color card2 = Color(0xff2B2B2B);
  static const Color card3 = Color(0xff161616);
  static const Color surfaceGrey = Color(0xff161616);
  static const Color actionBorder = Color(0xff2B2B2B);
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

  static Color offText(BuildContext context) {
    return getColor(
      context,
      light: AppColors.primary,
      dark: AppColors.offWhite,
    );
  }

  static Color primaryPlaceHolder(BuildContext context) {
    return getColor(
      context,
      light: LightAppColors.primaryPlaceHolder,
      dark: DarkAppColors.primaryPlaceHolder,
    );
  }

  static Color placeHolder(BuildContext context) {
    return getColor(
      context,
      light: LightAppColors.placeHolder,
      dark: DarkAppColors.placeHolder,
    );
  }

  static Color card(BuildContext context) {
    return getColor(
      context,
      light: LightAppColors.card,
      dark: DarkAppColors.card,
    );
  }

  static Color border(BuildContext context) {
    return getColor(
      context,
      light: LightAppColors.border,
      dark: DarkAppColors.border,
    );
  }

  static Color actionBorder(BuildContext context) {
    return getColor(
      context,
      light: LightAppColors.actionBorder,
      dark: DarkAppColors.actionBorder,
    );
  }

  static Color cardBackground(BuildContext context) {
    return getColor(
      context,
      light: LightAppColors.cardBackground,
      dark: DarkAppColors.cardBackground,
    );
  }

  static Color card2(BuildContext context) {
    return getColor(
      context,
      light: LightAppColors.card2,
      dark: DarkAppColors.card2,
    );
  }

  static Color card3(BuildContext context) {
    return getColor(
      context,
      light: LightAppColors.card3,
      dark: DarkAppColors.card3,
    );
  }

  static Color surfaceGrey(BuildContext context) {
    return getColor(
      context,
      light: LightAppColors.surfaceGrey,
      dark: DarkAppColors.surfaceGrey,
    );
  }
}

extension AppColorsExtension on BuildContext {
  Color get background => DynamicColors.background(this);

  Color get secondaryBackground => DynamicColors.secondaryBackground(this);

  Color get primaryColor => DynamicColors.primary(this);

  Color get textColor => DynamicColors.textColor(this);

  Color get secondaryTextColor => DynamicColors.secondaryTextColor(this);

  Color get sweetGrey => DynamicColors.sweetGrey(this);

  Color get offText => DynamicColors.offText(this);

  Color get primaryPlaceHolder => DynamicColors.primaryPlaceHolder(this);

  Color get placeHolder => DynamicColors.placeHolder(this);

  Color get card => DynamicColors.card(this);

  Color get border => DynamicColors.border(this);

  Color get actionBorder => DynamicColors.actionBorder(this);

  Color get cardBackground => DynamicColors.cardBackground(this);

  Color get card2 => DynamicColors.card2(this);

  Color get card3 => DynamicColors.card3(this);

  Color get surfaceGrey => DynamicColors.surfaceGrey(this);
}
