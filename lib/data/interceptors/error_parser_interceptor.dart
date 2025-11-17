import 'dart:io';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:test_giphy_app/domain/models/error/connection_server_error.dart';
import 'package:test_giphy_app/domain/models/error/server_error.dart';

@injectable
class ErrorParserInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final isConnectionError = _connectionErrors.contains(err.type) || err.error is HandshakeException;

    if (isConnectionError) {
      throw const ConnectionServerError();
    }

    throw ServerError(
      message: err.response?.statusMessage ?? 'Server error',
      code: err.response?.statusCode,
    );
  }

  static const _connectionErrors = [
    DioExceptionType.connectionTimeout,
    DioExceptionType.receiveTimeout,
    DioExceptionType.sendTimeout,
    DioExceptionType.connectionError,
  ];
}
