import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';

@injectable
class LoggingInterceptor extends Interceptor {
  final Logger logger;
  final _encoder = const JsonEncoder.withIndent('  ');

  LoggingInterceptor(this.logger);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    logger.e(
      'DioError: \n'
      'url: ${err.requestOptions.uri}\n'
      'query: ${err.requestOptions.queryParameters}\n'
      'headers: ${err.requestOptions.headers}'
      'requestBody: ${_tryToJsonString(err.requestOptions.data)}\n'
      'responseBody: ${_tryToJsonString(err.response?.data)}',
      error: err,
      stackTrace: err.stackTrace,
    );

    throw err;
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    logger.d(
      'request: ${options.method} ${options.uri.path}\n'
      'query: ${options.queryParameters}\n'
      'headers: ${options.headers}\n'
      'body: ${_tryToJsonString(options.data)}',
      stackTrace: StackTrace.empty,
    );

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    logger.d(
      'response: ${response.statusCode}\n'
      '${response.requestOptions.method} ${response.requestOptions.uri.path}\n'
      'query: ${response.requestOptions.queryParameters}\n'
      'headers: ${response.requestOptions.headers}\n'
      'body: ${_tryToJsonString(response.data)}',
      stackTrace: StackTrace.empty,
    );

    super.onResponse(response, handler);
  }

  // ignore: avoid-dynamic
  String _tryToJsonString(dynamic data) {
    try {
      return _encoder.convert(data);
    } catch (e) {
      return data.toString();
    }
  }
}
