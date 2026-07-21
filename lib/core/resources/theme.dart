import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:zet/core/resources/colors.dart';

abstract class AppTheme {
  AppTheme._();

  static final ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: LightAppColors.background,
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: LightAppColors.primary,
      selectionHandleColor: LightAppColors.primary,
      cursorColor: LightAppColors.primary,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      },
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: LightAppColors.background,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    ),
    iconTheme: const IconThemeData(
      color: LightAppColors.textColor,
      size: 24,
    ),
    primaryIconTheme: const IconThemeData(
      color: LightAppColors.textColor,
      size: 24,
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: DarkAppColors.background,
    textSelectionTheme: const TextSelectionThemeData(
      selectionColor: DarkAppColors.primary,
      selectionHandleColor: DarkAppColors.primary,
      cursorColor: DarkAppColors.primary,
    ),
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.iOS: ZoomPageTransitionsBuilder(),
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
      },
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: DarkAppColors.background,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    ),
    iconTheme: const IconThemeData(
      color: DarkAppColors.textColor,
      size: 24,
    ),
    primaryIconTheme: const IconThemeData(
      color: DarkAppColors.textColor,
      size: 24,
    ),
  );
}
