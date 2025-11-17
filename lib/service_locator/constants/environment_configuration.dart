import 'package:test_giphy_app/service_locator/constants/configuration_keys.dart';
import 'package:test_giphy_app/utils/static_assert.dart';

class EnvironmentConfiguration {
  const EnvironmentConfiguration._();

  @StaticAssert(
    bool.hasEnvironment(ConfigurationKeys.baseUrl),
    _assertMessage + ConfigurationKeys.baseUrl,
  )
  static const baseUrl = String.fromEnvironment(ConfigurationKeys.baseUrl);

  @StaticAssert(
    bool.hasEnvironment(ConfigurationKeys.apiKey),
    _assertMessage + ConfigurationKeys.apiKey,
  )
  static const apiKey = String.fromEnvironment(ConfigurationKeys.apiKey);

  static const _assertMessage = 'Not found environment variable with name - ';
}
