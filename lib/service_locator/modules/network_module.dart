import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:test_giphy_app/data/interceptors/error_parser_interceptor.dart';
import 'package:test_giphy_app/data/interceptors/logging_interceptor.dart';
import 'package:test_giphy_app/service_locator/constants/environment_configuration.dart';
import 'package:test_giphy_app/service_locator/constants/injection_keys.dart';

@module
abstract class NetworkModule {
  @Named(InjectionKeys.baseUrl)
  String get baseUrl => EnvironmentConfiguration.baseUrl;

  @Named(InjectionKeys.apiKey)
  String get apiKey => EnvironmentConfiguration.apiKey;

  @lazySingleton
  Dio dio(
    @Named(InjectionKeys.baseUrl) String url,
    LoggingInterceptor loggingInterceptor,
    ErrorParserInterceptor errorParserInterceptor,
  ) =>
      Dio(
          BaseOptions(baseUrl: url),
        )
        ..interceptors.addAll([
          loggingInterceptor,
          errorParserInterceptor,
        ]);
}
