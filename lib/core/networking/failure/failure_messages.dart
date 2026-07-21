import 'package:easy_localization/easy_localization.dart';
import 'package:zet/core/helpers/locale_keys.dart';

class FailureMessages {
  // ───────────── Network Errors ─────────────
  static String get connectionTimeout => tr(LocaleKeys.connectionTimeout);

  static String get sendTimeout => tr(LocaleKeys.sendTimeout);

  static String get receiveTimeout => tr(LocaleKeys.receiveTimeout);

  static String get transformTimeout => tr(LocaleKeys.receiveTimeout);

  static String get noInternet => tr(LocaleKeys.noInternet);

  static String get connectionError => tr(LocaleKeys.connectionError);

  static String get badCertificate => tr(LocaleKeys.connectionError);

  // ───────────── Auth & Permission Errors ─────────────
  static String get unauthorized => tr(LocaleKeys.unauthorized);

  static String get forbidden => tr(LocaleKeys.forbidden);

  // ───────────── Request & Validation Errors ─────────────
  static String get badRequest => tr(LocaleKeys.badRequest);

  static String get invalidDataProvided => tr(LocaleKeys.badRequest);

  static String get notFound => tr(LocaleKeys.notFound);

  static String get requestTimeout => tr(LocaleKeys.connectionTimeout);

  static String get conflict => tr(LocaleKeys.badRequest);

  // ───────────── Server Errors ─────────────
  static String get internalServerError => tr(LocaleKeys.internalServerError);

  static String get serviceUnavailable => tr(LocaleKeys.serviceUnavailable);

  // ───────────── General Errors ─────────────
  static String get cancelled => tr(LocaleKeys.cancelled);

  static String get unknown => tr(LocaleKeys.unknown);
}
