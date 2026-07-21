import 'package:easy_localization/easy_localization.dart' hide TextDirection;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zet/core/cubit/app_cubit.dart';
import 'package:zet/core/cubit/app_state.dart';
import 'package:zet/core/helpers/locale_keys.dart';
import 'package:zet/core/resources/assets.dart';
import 'package:zet/core/resources/colors.dart';
import 'package:zet/features/more/presentation/views/settings/widgets/settings_option_item.dart';
import 'package:zet/features/more/presentation/views/settings/widgets/settings_toggle_pill.dart';

class SettingsBody extends StatelessWidget {
  const SettingsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: Column(
        spacing: 12.h,
        children: [
          BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              final bool isLight = state.themeMode == ThemeMode.light;
              return SettingsOptionItem(
                title: context.tr(LocaleKeys.appAppearance),
                icon: SvgPicture.asset(
                  AppSvgs.sun03,
                  width: 24.w,
                  height: 24.h,
                  colorFilter: ColorFilter.mode(
                    context.textColor,
                    BlendMode.srcIn,
                  ),
                ),
                trailing: SettingsTogglePill(
                  option1: context.tr(LocaleKeys.light),
                  option2: context.tr(LocaleKeys.dark),
                  selectedIndex: isLight ? 0 : 1,
                  onChanged: (index) {
                    AppCubit.get(context).toggleTheme(
                      index == 0 ? ThemeMode.light : ThemeMode.dark,
                    );
                  },
                ),
              );
            },
          ),
          BlocBuilder<AppCubit, AppState>(
            builder: (context, state) {
              final bool isArabic = context.locale.languageCode == 'ar';
              return SettingsOptionItem(
                title: context.tr(LocaleKeys.appLanguage),
                icon: SvgPicture.asset(
                  AppSvgs.languageSquare,
                  width: 24.w,
                  height: 24.h,
                  colorFilter: ColorFilter.mode(
                    context.textColor,
                    BlendMode.srcIn,
                  ),
                ),
                trailing: SettingsTogglePill(
                  option1: context.tr(LocaleKeys.arabic),
                  option2: context.tr(LocaleKeys.english),
                  selectedIndex: isArabic ? 0 : 1,
                  onChanged: (index) {
                    AppCubit.get(context).changeLanguage(
                      context,
                      Locale(index == 0 ? 'ar' : 'en'),
                    );
                  },
                ),
              );
            },
          ),
          SettingsOptionItem(
            title: context.tr(LocaleKeys.termsOfUse),
            icon: SvgPicture.asset(
              AppSvgs.agreement01,
              width: 24.w,
              height: 24.h,
              colorFilter: ColorFilter.mode(
                context.textColor,
                BlendMode.srcIn,
              ),
            ),
            onTap: () {},
          ),
          SettingsOptionItem(
            title: context.tr(LocaleKeys.privacyPolicy),
            icon: SvgPicture.asset(
              AppSvgs.security,
              width: 24.w,
              height: 24.h,
              colorFilter: ColorFilter.mode(
                context.textColor,
                BlendMode.srcIn,
              ),
            ),
            onTap: () {},
          ),
          SettingsOptionItem(
            title: context.tr(LocaleKeys.logout),
            icon: SvgPicture.asset(
              AppSvgs.logoutSquare01,
              width: 24.w,
              height: 24.h,
              colorFilter: ColorFilter.mode(
                context.textColor,
                BlendMode.srcIn,
              ),
            ),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
