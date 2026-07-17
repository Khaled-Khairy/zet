import 'dart:io';

import 'package:dio/dio.dart';

import 'failure_messages.dart';

abstract class Failure {
  final String message;

  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);

  factory ServerFailure.fromDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure(FailureMessages.connectionTimeout);

      case DioExceptionType.sendTimeout:
        return ServerFailure(FailureMessages.sendTimeout);

      case DioExceptionType.receiveTimeout:
        return ServerFailure(FailureMessages.receiveTimeout);

      case DioExceptionType.transformTimeout:
        return ServerFailure(FailureMessages.transformTimeout);

      case DioExceptionType.badCertificate:
        return ServerFailure(FailureMessages.badCertificate);

      case DioExceptionType.cancel:
        return ServerFailure(FailureMessages.cancelled);

      case DioExceptionType.connectionError:
        return _isNetworkError(error) ? ServerFailure(FailureMessages.noInternet) : ServerFailure(FailureMessages.connectionError);

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          statusCode: error.response?.statusCode ?? 500,
          data: error.response?.data,
        );

      case DioExceptionType.unknown:
        return _isNetworkError(error) ? ServerFailure(FailureMessages.noInternet) : ServerFailure(FailureMessages.unknown);
    }
  }

  factory ServerFailure.fromResponse({
    required int statusCode,
    dynamic data,
  }) {
    final String? parsedMessage = _parseResponseMessage(data);

    switch (statusCode) {
      case 400:
        return ServerFailure(
          parsedMessage ?? FailureMessages.badRequest,
        );

      case 401:
        return ServerFailure(
          parsedMessage ?? FailureMessages.unauthorized,
        );

      case 403:
        return ServerFailure(
          parsedMessage ?? FailureMessages.forbidden,
        );

      case 404:
        return ServerFailure(
          FailureMessages.notFound,
        );

      case 408:
        return ServerFailure(
          FailureMessages.requestTimeout,
        );

      case 409:
        return ServerFailure(
          parsedMessage ?? FailureMessages.conflict,
        );

      case 422:
        return ServerFailure(
          parsedMessage ?? FailureMessages.invalidDataProvided,
        );

      case 500:
        return ServerFailure(
          FailureMessages.internalServerError,
        );

      case 503:
        return ServerFailure(
          FailureMessages.serviceUnavailable,
        );

      default:
        return ServerFailure(
          '${FailureMessages.unknown} (HTTP $statusCode)',
        );
    }
  }

  // ───────────── Helpers ─────────────

  static String? _parseResponseMessage(dynamic data) {
    if (data == null) return null;

    if (data is Map) {
      if (data['message'] != null && data['message'].toString().isNotEmpty) {
        return data['message'].toString();
      }

      if (data['error'] != null && data['error'].toString().isNotEmpty) {
        return data['error'].toString();
      }

      if (data['errors'] is List && data['errors'].isNotEmpty) {
        return (data['errors'] as List).join(' | ');
      }
    }

    if (data is String && data.isNotEmpty) {
      return data;
    }

    if (data is List && data.isNotEmpty) {
      return data.join(' | ');
    }

    return null;
  }

  static bool _isNetworkError(DioException error) {
    return error.error is SocketException || (error.message?.contains('SocketException') ?? false);
  }
}
