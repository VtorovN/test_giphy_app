import 'package:flutter/material.dart';
import 'package:test_giphy_app/presentation/giphy_app.dart';
import 'package:test_giphy_app/service_locator/injection.dart';

void main() async {
  await _setup();

  runApp(const GiphyApp());
}

Future<void> _setup() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();
}
