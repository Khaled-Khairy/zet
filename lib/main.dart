import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:zet/core/di/service_locator.dart';
import 'package:zet/zet.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait(
    [
      EasyLocalization.ensureInitialized(),
      setupServiceLocator(),
    ],
  );

  runApp(
    EasyLocalization(
      startLocale: const Locale('ar'),
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('ar'),
      child: const Zet(),
    ),
  );
}
