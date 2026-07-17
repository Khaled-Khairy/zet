import 'package:zet/core/di/service_locator.dart';
import 'package:zet/core/helpers/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_pref_keys.dart';

class SharedPrefHelper {
  // Private constructor to prevent instantiation
  SharedPrefHelper._();

  static SharedPreferences get _sharedPreferences => getIt.get<SharedPreferences>();

  /// Reloads the cache from disk.
  static Future<void> reload() async {
    await _sharedPreferences.reload();
  }

  /// Checks if a key exists in SharedPreferences.
  static bool containsKey({required String key}) {
    return _sharedPreferences.containsKey(key);
  }

  /// Retrieves all keys in SharedPreferences.
  static Set<String> getKeys() {
    return _sharedPreferences.getKeys();
  }

  /// Removes a value associated with the given [key].
  static Future<void> removeData({required String key}) async {
    Logger.info(' Removing data with key: $key', name: 'SharedPrefHelper');
    await _sharedPreferences.remove(key);
  }

  /// Clears all data in SharedPreferences.
  static Future<void> clearAllData() async {
    Logger.warning('Clearing all data', name: 'SharedPrefHelper');
    await _sharedPreferences.clear();
  }

  /// Clears all data in SharedPreferences except the given [keys].
  /// Supports 1 or more keys to preserve.
  static Future<void> clearAllDataExcept({required List<String> keys}) async {
    Logger.warning('Clearing all data except keys: $keys', name: 'SharedPrefHelper');

    // Snapshot the values we want to keep BEFORE clearing
    final Map<String, dynamic> preserved = {};
    for (final key in keys) {
      final value = _sharedPreferences.get(key);
      if (value != null) {
        preserved[key] = value;
      }
    }

    // Clear everything
    await _sharedPreferences.clear();

    // Restore the preserved key-value pairs
    for (final entry in preserved.entries) {
      await setData(key: entry.key, value: entry.value);
    }

    Logger.success('Restored preserved keys: ${preserved.keys.toList()}', name: 'SharedPrefHelper');
  }

  /// Saves a [value] with the given [key] in SharedPreferences.
  /// Supports [String], [int], [bool], and [double] values.
  static Future<void> setData({required String key, required dynamic value}) async {
    Logger.success('Setting data with key: $key and value: $value', name: 'SharedPrefHelper');
    if (value is String) {
      await _sharedPreferences.setString(key, value);
    } else if (value is int) {
      await _sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      await _sharedPreferences.setBool(key, value);
    } else if (value is double) {
      await _sharedPreferences.setDouble(key, value);
    } else {
      throw ArgumentError('Unsupported value type: ${value.runtimeType}');
    }
  }

  /// Retrieves a bool value associated with the given [key].
  /// Returns `false` if the key does not exist.
  static bool getBool({required String key}) {
    Logger.info('Retrieving bool with key: $key', name: 'SharedPrefHelper');
    return _sharedPreferences.getBool(key) ?? false;
  }

  /// Retrieves a double value associated with the given [key].
  /// Returns `0.0` if the key does not exist.
  static double getDouble({required String key}) {
    Logger.info('Retrieving double with key: $key', name: 'SharedPrefHelper');
    return _sharedPreferences.getDouble(key) ?? 0.0;
  }

  /// Retrieves an int value associated with the given [key].
  /// Returns `0` if the key does not exist.
  static int getInt({required String key}) {
    Logger.info('Retrieving int with key: $key', name: 'SharedPrefHelper');
    return _sharedPreferences.getInt(key) ?? 0;
  }

  /// Retrieves a String value associated with the given [key].
  /// Returns an empty string if the key does not exist.
  static String getString({required String key}) {
    Logger.info('Retrieving string with key: $key', name: 'SharedPrefHelper');
    return _sharedPreferences.getString(key) ?? '';
  }
}
