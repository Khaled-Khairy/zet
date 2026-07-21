import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zet/core/cubit/app_state.dart';

class AppCubit extends Cubit<AppState> {
  final SharedPreferences _prefs;

  static const String _themeKey = 'is_dark_mode';
  static const String _langKey = 'locale_lang';

  AppCubit(this._prefs)
      : super(
          AppState.initial(
            isDark: _prefs.getBool(_themeKey) ?? false,
            langCode: _prefs.getString(_langKey) ?? 'ar',
          ),
        );

  static AppCubit get(BuildContext context) => BlocProvider.of<AppCubit>(context);

  void toggleTheme(ThemeMode mode) async {
    final isDark = mode == ThemeMode.dark;
    await _prefs.setBool(_themeKey, isDark);
    emit(state.copyWith(themeMode: mode));
  }

  void changeLanguage(BuildContext context, Locale newLocale) async {
    await context.setLocale(newLocale);
    await _prefs.setString(_langKey, newLocale.languageCode);
    emit(state.copyWith(locale: newLocale));
  }
}
