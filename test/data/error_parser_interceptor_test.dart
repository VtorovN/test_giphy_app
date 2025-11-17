import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_giphy_app/data/interceptors/error_parser_interceptor.dart';
import 'package:test_giphy_app/domain/models/error/connection_server_error.dart';
import 'package:test_giphy_app/domain/models/error/server_error.dart';

void main() {
  group(
    'ErrorParserInterceptor group',
    () {
      const path = '/';

      late ErrorParserInterceptor interceptor;

      setUp(() {
        interceptor = ErrorParserInterceptor();
      });

      test(
        'Throws ConnectionServerError on connection-related DioException types',
        () {
          // DioExceptionTypes
          for (final type in [
            DioExceptionType.connectionTimeout,
            DioExceptionType.receiveTimeout,
            DioExceptionType.sendTimeout,
            DioExceptionType.connectionError,
          ]) {
            final dioError = DioException(
              requestOptions: RequestOptions(path: path),
              type: type,
            );

            expect(
              () => interceptor.onError(dioError, ErrorInterceptorHandler()),
              throwsA(
                isA<ConnectionServerError>(),
              ),
            );
          }

          // HandshakeException
          final dioErrorWithHandshake = DioException(
            requestOptions: RequestOptions(path: path),
            error: const HandshakeException('Failed handshake'),
          );

          expect(
            () => interceptor.onError(dioErrorWithHandshake, ErrorInterceptorHandler()),
            throwsA(
              isA<ConnectionServerError>(),
            ),
          );
        },
      );

      test(
        'Throws ServerError for other error types with correct status info',
        () {
          const statusMessage = 'Internal error';
          const statusCode = 500;

          final response = Response(
            requestOptions: RequestOptions(path: path),
            statusCode: statusCode,
            statusMessage: statusMessage,
          );

          final dioError = DioException(
            requestOptions: response.requestOptions,
            response: response,
            type: DioExceptionType.badResponse,
          );

          try {
            interceptor.onError(dioError, ErrorInterceptorHandler());
            fail('Expected ServerError to be thrown');
          } catch (e) {
            expect(e, isA<ServerError>());

            final err = e as ServerError;

            expect(err.code, equals(statusCode));
            expect(err.message, equals(statusMessage));
          }
        },
      );
    },
  );
}
