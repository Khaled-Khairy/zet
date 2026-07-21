import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_state.freezed.dart';

@freezed
abstract class AppState with _$AppState {
  const factory AppState({
    required ThemeMode themeMode,
    required Locale locale,
  }) = _AppState;

  factory AppState.initial({bool isDark = false, String langCode = 'ar'}) {
    return AppState(
      themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
      locale: Locale(langCode),
    );
  }
}
