import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:test_giphy_app/service_locator/injection.config.dart';

final locator = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => locator.init();
