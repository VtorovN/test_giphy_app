# test_giphy_app

## Description
A simple Flutter application that fetches and displays gifs from a public [Giphy API](https://api.giphy.com/).

## SDK
- Flutter: 3.38.1
- Dart: 3.10.0

## Stack
- Flutter
- State Management: Bloc
- HTTP Client: Retrofit + Dio
- Dependency Injection: GetIt + Injectable
- Serialization: JsonSerializable
- Navigation: AutoRoute
- Tests: Flutter Test, Mockito

## To run
- Run `flutter pub get`
- Run `dart run build_runner build`
- Run `flutter gen-l10n`
- Obtain an API key from Giphy
- Create config file in json format at project root (e.g. `config.json`)
- Add configuration values in json format, e.g.:
    ```json
    {
      "apiUrl": "https://api.giphy.com/v1",
      "apiKey": "your_api_key_here"
    }
    ```
- Run project with `--dart-define-from-file` argument providing config name, e.g. `flutter run --dart-define-from-file=config.json`
- 