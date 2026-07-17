import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:zet/core/helpers/font_weight_helper.dart';
import 'package:zet/core/resources/colors.dart';

abstract class AppTextStyles {
  AppTextStyles._();

  static TextStyle _base({
    required BuildContext context,
    required double fontSize,
    required FontWeight fontWeight,
    Color? color,
  }) {
    return TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color ?? DynamicColors.textColor(context),
    );
  }

  static TextStyle _style(
    BuildContext context,
    double size,
    FontWeight weight, {
    Color? color,
  }) {
    return _base(
      context: context,
      fontSize: size.sp,
      fontWeight: weight,
      color: color,
    );
  }

  // 12
  static TextStyle style12Regular(BuildContext context, {Color? color}) => _style(context, 12, FontWeightHelper.regular, color: color);

  static TextStyle style12Medium(BuildContext context, {Color? color}) => _style(context, 12, FontWeightHelper.medium, color: color);

  static TextStyle style12SemiBold(BuildContext context, {Color? color}) => _style(context, 12, FontWeightHelper.semiBold, color: color);

  static TextStyle style12Bold(BuildContext context, {Color? color}) => _style(context, 12, FontWeightHelper.bold, color: color);

  // 13
  static TextStyle style13Regular(BuildContext context, {Color? color}) => _style(context, 13, FontWeightHelper.regular, color: color);

  static TextStyle style13Medium(BuildContext context, {Color? color}) => _style(context, 13, FontWeightHelper.medium, color: color);

  static TextStyle style13SemiBold(BuildContext context, {Color? color}) => _style(context, 13, FontWeightHelper.semiBold, color: color);

  static TextStyle style13Bold(BuildContext context, {Color? color}) => _style(context, 13, FontWeightHelper.bold, color: color);

  // 14
  static TextStyle style14Regular(BuildContext context, {Color? color}) => _style(context, 14, FontWeightHelper.regular, color: color);

  static TextStyle style14Medium(BuildContext context, {Color? color}) => _style(context, 14, FontWeightHelper.medium, color: color);

  static TextStyle style14SemiBold(BuildContext context, {Color? color}) => _style(context, 14, FontWeightHelper.semiBold, color: color);

  static TextStyle style14Bold(BuildContext context, {Color? color}) => _style(context, 14, FontWeightHelper.bold, color: color);

  // 15
  static TextStyle style15Regular(BuildContext context, {Color? color}) => _style(context, 15, FontWeightHelper.regular, color: color);

  static TextStyle style15Medium(BuildContext context, {Color? color}) => _style(context, 15, FontWeightHelper.medium, color: color);

  static TextStyle style15SemiBold(BuildContext context, {Color? color}) => _style(context, 15, FontWeightHelper.semiBold, color: color);

  static TextStyle style15Bold(BuildContext context, {Color? color}) => _style(context, 15, FontWeightHelper.bold, color: color);

  // 16
  static TextStyle style16Regular(BuildContext context, {Color? color}) => _style(context, 16, FontWeightHelper.regular, color: color);

  static TextStyle style16Medium(BuildContext context, {Color? color}) => _style(context, 16, FontWeightHelper.medium, color: color);

  static TextStyle style16SemiBold(BuildContext context, {Color? color}) => _style(context, 16, FontWeightHelper.semiBold, color: color);

  static TextStyle style16Bold(BuildContext context, {Color? color}) => _style(context, 16, FontWeightHelper.bold, color: color);

  // 18
  static TextStyle style18Regular(BuildContext context, {Color? color}) => _style(context, 18, FontWeightHelper.regular, color: color);

  static TextStyle style18Medium(BuildContext context, {Color? color}) => _style(context, 18, FontWeightHelper.medium, color: color);

  static TextStyle style18SemiBold(BuildContext context, {Color? color}) => _style(context, 18, FontWeightHelper.semiBold, color: color);

  static TextStyle style18Bold(BuildContext context, {Color? color}) => _style(context, 18, FontWeightHelper.bold, color: color);

  // 20
  static TextStyle style20Regular(BuildContext context, {Color? color}) => _style(context, 20, FontWeightHelper.regular, color: color);

  static TextStyle style20Medium(BuildContext context, {Color? color}) => _style(context, 20, FontWeightHelper.medium, color: color);

  static TextStyle style20SemiBold(BuildContext context, {Color? color}) => _style(context, 20, FontWeightHelper.semiBold, color: color);

  static TextStyle style20Bold(BuildContext context, {Color? color}) => _style(context, 20, FontWeightHelper.bold, color: color);

  // 22
  static TextStyle style22Regular(BuildContext context, {Color? color}) => _style(context, 22, FontWeightHelper.regular, color: color);

  static TextStyle style22Medium(BuildContext context, {Color? color}) => _style(context, 22, FontWeightHelper.medium, color: color);

  static TextStyle style22SemiBold(BuildContext context, {Color? color}) => _style(context, 22, FontWeightHelper.semiBold, color: color);

  static TextStyle style22Bold(BuildContext context, {Color? color}) => _style(context, 22, FontWeightHelper.bold, color: color);

  // 24
  static TextStyle style24Regular(BuildContext context, {Color? color}) => _style(context, 24, FontWeightHelper.regular, color: color);

  static TextStyle style24Medium(BuildContext context, {Color? color}) => _style(context, 24, FontWeightHelper.medium, color: color);

  static TextStyle style24SemiBold(BuildContext context, {Color? color}) => _style(context, 24, FontWeightHelper.semiBold, color: color);

  static TextStyle style24Bold(BuildContext context, {Color? color}) => _style(context, 24, FontWeightHelper.bold, color: color);

  // 28
  static TextStyle style28Regular(BuildContext context, {Color? color}) => _style(context, 28, FontWeightHelper.regular, color: color);

  static TextStyle style28Medium(BuildContext context, {Color? color}) => _style(context, 28, FontWeightHelper.medium, color: color);

  static TextStyle style28SemiBold(BuildContext context, {Color? color}) => _style(context, 28, FontWeightHelper.semiBold, color: color);

  static TextStyle style28Bold(BuildContext context, {Color? color}) => _style(context, 28, FontWeightHelper.bold, color: color);

  // 32
  static TextStyle style32Regular(BuildContext context, {Color? color}) => _style(context, 32, FontWeightHelper.regular, color: color);

  static TextStyle style32Medium(BuildContext context, {Color? color}) => _style(context, 32, FontWeightHelper.medium, color: color);

  static TextStyle style32SemiBold(BuildContext context, {Color? color}) => _style(context, 32, FontWeightHelper.semiBold, color: color);

  static TextStyle style32Bold(BuildContext context, {Color? color}) => _style(context, 32, FontWeightHelper.bold, color: color);
}
