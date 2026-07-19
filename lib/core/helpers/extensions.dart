import 'package:easy_localization/easy_localization.dart' as ez;
import 'package:flutter/material.dart';

extension LocaleDirection on BuildContext {
  bool get isRtl => locale.languageCode == 'ar';

  bool get isLtr => !isRtl;

  TextDirection get textDirection => isRtl ? TextDirection.rtl : TextDirection.ltr;
}
