import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';

abstract class AppHelpers {
  AppHelpers._();

  /// Returns true if the current locale language is Arabic ('ar')
  static bool isArabic(BuildContext context) => context.locale.languageCode == 'ar';

  /// Returns true if the current locale language is English ('en')
  static bool isEnglish(BuildContext context) => context.locale.languageCode == 'en';

  /// Returns the current app [TextDirection] (RTL or LTR)
  static TextDirection getDirectionality(BuildContext context) => Directionality.of(context);

  /// Returns true if the current directionality is RTL
  static bool isRtl(BuildContext context) => getDirectionality(context) == TextDirection.rtl;

  /// Returns true if the current directionality is LTR
  static bool isLtr(BuildContext context) => getDirectionality(context) == TextDirection.ltr;
}

extension AppHelpersExtension on BuildContext {
  /// Returns true if the current locale language is Arabic ('ar')
  bool get isArabic => AppHelpers.isArabic(this);

  /// Returns true if the current locale language is English ('en')
  bool get isEnglish => AppHelpers.isEnglish(this);

  /// Returns the current app [TextDirection]
  TextDirection get directionality => AppHelpers.getDirectionality(this);

  /// Returns true if the current directionality is RTL
  bool get isRtl => AppHelpers.isRtl(this);

  /// Returns true if the current directionality is LTR
  bool get isLtr => AppHelpers.isLtr(this);
}
