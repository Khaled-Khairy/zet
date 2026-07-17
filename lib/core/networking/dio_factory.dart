import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:zet/core/helpers/logger.dart';
import 'package:zet/core/helpers/shared_pref/shared_pref_helper.dart';
import 'package:zet/core/networking/api_endpoints.dart';
// ignore: depend_on_referenced_packages
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// A singleton factory class for configuring and managing a Dio instance.
class DioFactory {
  // Private constructor to prevent direct instantiation
  DioFactory._();

  // Default timeout duration for API requests
  static const _defaultTimeout = Duration(seconds: 160);

  // Private static Dio instance
  static Dio? _dioInstance;
  static InterceptorsWrapper? _authInterceptor;

  /// Getter to retrieve the Dio instance
  /// Throws an exception if initialize() is not called before accessing it
  static Dio get dio {
    if (_dioInstance == null) {
      throw Exception('Dio instance not initialized. Call initialize() first.');
    }
    return _dioInstance!;
  }

  /// Initializes the Dio instance if it's not already created
  static Future<void> initialize() async {
    if (_dioInstance != null) return;

    try {
      _dioInstance = Dio(
        BaseOptions(
          baseUrl: ApiEndpoints.baseUrl,
          connectTimeout: _defaultTimeout,
          receiveTimeout: _defaultTimeout,
          sendTimeout: _defaultTimeout,
        ),
      );

      _addAuthInterceptor();
      _addLoggingInterceptor();
    } catch (e) {
      Logger.error('Failed to initialize Dio: $e');
      rethrow;
    }
  }

  /// Adds an interceptor to attach the authentication token to each request
  static void _addAuthInterceptor() {
    // Remove only previously stored auth interceptor (don't remove other wrappers).
    if (_authInterceptor != null) {
      _dioInstance?.interceptors.remove(_authInterceptor);
    }

    _authInterceptor = InterceptorsWrapper(
      onRequest: (options, handler) async {
        final String token = SharedPrefHelper.getString(key: SharedPrefKeys.token);
        if (token.isNotEmpty) options.headers['Authorization'] = 'Bearer $token';
        return handler.next(options);
      },
    );

    // Ensure auth interceptor runs before others (so logger sees the headers).
    _dioInstance?.interceptors.insert(0, _authInterceptor!);
  }

  /// Adds a logging interceptor for debugging API requests and responses
  static void _addLoggingInterceptor() {
    if (kDebugMode) {
      _dioInstance?.interceptors.add(PrettyDioLogger(requestHeader: true, requestBody: true, responseBody: true));
    }
  }

  static Future<void> updateAuthToken(String newToken) async {
    await SharedPrefHelper.setData(key: SharedPrefKeys.token, value: newToken);
    _addAuthInterceptor(); // safely refresh interceptor
  }

  /// Clears the stored authentication token and removes it from requests
  static Future<void> clearAuthToken() async {
    await SharedPrefHelper.removeData(key: SharedPrefKeys.token);

    if (_authInterceptor != null) {
      _dioInstance?.interceptors.remove(_authInterceptor);
    }

    _addAuthInterceptor(); // Re-add without token
  }

  static void dispose() {
    _dioInstance?.close(force: true);
    _dioInstance = null;
    _authInterceptor = null;
  }
}
