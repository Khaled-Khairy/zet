import 'dart:developer' as developer;

import 'package:flutter/foundation.dart' show kReleaseMode;
import 'package:flutter/material.dart';

/// Logger class with improved Android Studio compatibility
class Logger {
  static bool _enableLogging = !kReleaseMode;
  static bool _usePrint = false;
  static String _defaultName = 'App';

  /// Configure logger settings
  static void configure({
    bool? enableLogging,
    bool? usePrint,
    String? defaultName,
  }) {
    _enableLogging = enableLogging ?? _enableLogging;
    _usePrint = usePrint ?? _usePrint;
    _defaultName = defaultName ?? _defaultName;
  }

  /// Enable or disable logging at runtime
  static void setLoggingEnabled(bool enabled) {
    _enableLogging = enabled;
  }

  /// Check if logging is currently enabled
  static bool get isLoggingEnabled => _enableLogging;

  // ANSI color codes
  static const _reset = '\x1B[0m';
  static const _red = '\x1B[31m';
  static const _green = '\x1B[32m';
  static const _yellow = '\x1B[33m';
  static const _blue = '\x1B[34m';
  static const _purple = '\x1B[35m';
  static const _cyan = '\x1B[36m';

  /// Internal log method
  static void _log(
      String message, {
        required String colorCode,
        String? name,
        bool? usePrint,
        StackTrace? stackTrace,
      }) {
    if (!_enableLogging) return;

    final String logName = name ?? _defaultName;
    final bool shouldUsePrint = usePrint ?? true;
    final String coloredName = '$colorCode[$logName]$_reset';
    final String coloredMessage = '$colorCode$message$_reset';

    if (shouldUsePrint) {
      debugPrint('$coloredName: $coloredMessage');
      if (stackTrace != null) {
        debugPrint('$colorCode$stackTrace$_reset');
      }
    } else {
      developer.log(message, name: logName, stackTrace: stackTrace);
    }
  }

  static void _logSimple(
      String message, {
        required String colorCode,
        bool? usePrint,
        StackTrace? stackTrace,
      }) {
    if (!_enableLogging) return;

    final bool shouldUsePrint = usePrint ?? true;
    final String coloredMessage = '$colorCode$message$_reset';

    if (shouldUsePrint) {
      debugPrint(coloredMessage);
      if (stackTrace != null) {
        debugPrint('$colorCode$stackTrace$_reset');
      }
    } else {
      developer.log(message, stackTrace: stackTrace);
    }
  }

  /// Error log (red) — critical issues
  static void error(
      String message, {
        String? name,
        bool? usePrint,
        StackTrace? stackTrace,
      }) {
    _log(
      '❌ ERROR: $message',
      colorCode: _red,
      name: name,
      usePrint: usePrint,
      stackTrace: stackTrace,
    );
  }

  /// Success log (green) — successful operations
  static void success(
      String message, {
        String? name,
        bool? usePrint,
      }) {
    _log(
      '✅ SUCCESS: $message',
      colorCode: _green,
      name: name,
      usePrint: usePrint,
    );
  }

  /// Warning log (yellow) — warnings
  static void warning(
      String message, {
        String? name,
        bool? usePrint,
        StackTrace? stackTrace,
      }) {
    _log(
      '⚠️ WARNING: $message',
      colorCode: _yellow,
      name: name,
      usePrint: usePrint,
      stackTrace: stackTrace,
    );
  }

  /// Info log (blue) — general information
  static void info(
      String message, {
        String? name,
        bool? usePrint,
      }) {
    _log(
      'ℹ️ INFO: $message',
      colorCode: _blue,
      name: name,
      usePrint: usePrint,
    );
  }

  /// Debug log (cyan) — debug information
  static void debug(
      String message, {
        String? name,
        bool? usePrint,
      }) {
    _log(
      '🐛 DEBUG: $message',
      colorCode: _cyan,
      name: name,
      usePrint: usePrint,
    );
  }

  /// Alarm log (green) — alarm scheduling and cancellation events
  static void alarm(
      String message, {
        bool? usePrint,
      }) {
    _logSimple(
      message,
      colorCode: _cyan,
      usePrint: usePrint,
    );
  }

  /// Verbose log (purple) — detailed tracing
  static void verbose(
      String message, {
        String? name,
        bool? usePrint,
      }) {
    _log(
      '📋 VERBOSE: $message',
      colorCode: _purple,
      name: name,
      usePrint: usePrint,
    );
  }

  /// Network log (cyan) — API calls
  static void network(
      String message, {
        String? name,
        bool? usePrint,
      }) {
    _log(
      '🌐 NETWORK: $message',
      colorCode: _cyan,
      name: name,
      usePrint: usePrint,
    );
  }

  /// Performance log (yellow) — performance measurements
  static void performance(
      String message, {
        String? name,
        bool? usePrint,
      }) {
    _log(
      '⚡ PERFORMANCE: $message',
      colorCode: _yellow,
      name: name,
      usePrint: usePrint,
    );
  }
}

// ─── Legacy top-level functions ───────────────────────────────────────────────

void errorLog(String message, {String name = 'App', bool usePrint = false}) => Logger.error(message, name: name, usePrint: usePrint);

void successLog(String message, {String name = 'App', bool usePrint = false}) => Logger.success(message, name: name, usePrint: usePrint);

void alertLog(String message, {String name = 'App', bool usePrint = false}) => Logger.warning(message, name: name, usePrint: usePrint);

void blueLog(String message, {String name = 'App', bool usePrint = false}) => Logger.info(message, name: name, usePrint: usePrint);

void purpleLog(String message, {String name = 'App', bool usePrint = false}) => Logger.verbose(message, name: name, usePrint: usePrint);

void whiteLog(String message, {String name = 'App', bool usePrint = false}) => _LegacyLogger.whiteLog(message, name: name, usePrint: usePrint);

// ─── Legacy white log ─────────────────────────────────────────────────────────

class _LegacyLogger {
  static void whiteLog(
      String message, {
        String name = 'App',
        bool usePrint = false,
      }) {
    if (!Logger.isLoggingEnabled) return;

    const String white = '\x1B[37m';
    const String reset = '\x1B[0m';
    final String timestamp = DateTime.now().toIso8601String().substring(11, 23);

    if (usePrint) {
      debugPrint(
        '[$timestamp] $white[$name]$reset: $white$message$reset',
        wrapWidth: 1024,
      );
    } else {
      developer.log(
        '[$timestamp] $message',
        name: '$white$name$reset',
        time: DateTime.now(),
      );
    }
  }
}