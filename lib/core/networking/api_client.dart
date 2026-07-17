import 'package:dio/dio.dart';
import 'package:zet/core/networking/api_result.dart';
import 'package:zet/core/networking/api_services.dart';
import 'package:zet/core/networking/failure/api_failure.dart';

class ApiClient {
  final ApiService apiService;

  ApiClient(this.apiService);

  Future<ApiResult<T>> get<T>(String endpoint, {Map<String, dynamic>? queryParameters, required T Function(dynamic json) fromJson}) {
    return _execute(
      () => apiService.get(endpoint: endpoint, queryParameters: queryParameters),
      fromJson,
    );
  }

  Future<ApiResult<T>> post<T>(String endpoint, {Object? body, required T Function(dynamic json) fromJson}) {
    return _execute(
      () => apiService.post(endpoint: endpoint, data: body),
      fromJson,
    );
  }

  Future<ApiResult<T>> put<T>(String endpoint, {Map<String, dynamic>? queryParameters, Object? body, required T Function(dynamic json) fromJson}) {
    return _execute(
      () => apiService.put(endpoint: endpoint, queryParameters: queryParameters, data: body),
      fromJson,
    );
  }

  Future<ApiResult<T>> patch<T>(String endpoint, {Map<String, dynamic>? queryParameters, Object? body, required T Function(dynamic json) fromJson}) {
    return _execute(
      () => apiService.patch(endpoint: endpoint, queryParameters: queryParameters, data: body),
      fromJson,
    );
  }

  Future<ApiResult<T>> delete<T>(String endpoint, {Map<String, dynamic>? queryParameters, required T Function(dynamic json) fromJson}) {
    return _execute(
      () => apiService.delete(endpoint: endpoint, queryParameters: queryParameters),
      fromJson,
    );
  }

  Future<ApiResult<T>> _execute<T>(Future<dynamic> Function() call, T Function(dynamic json) fromJson) async {
    try {
      final data = await call();
      return ApiResult.success(fromJson(data));
    } on DioException catch (e) {
      return ApiResult.failure(ServerFailure.fromDioException(e));
    } catch (e) {
      return ApiResult.failure(ServerFailure(e.toString()));
    }
  }
}
