import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_giphy_app/presentation/res/app_theme.dart';
import 'package:test_giphy_app/presentation/res/localization/app_localizations.dart';
import 'package:test_giphy_app/routing/app_router.dart';
import 'package:test_giphy_app/service_locator/injection.dart';

class GiphyApp extends StatefulWidget {
  const GiphyApp({super.key});

  @override
  State<GiphyApp> createState() => _GiphyAppState();
}

class _GiphyAppState extends State<GiphyApp> {
  late final RootStackRouter _rootRouter;

  @override
  void initState() {
    super.initState();
    _rootRouter = locator<AppRouter>();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: AppTheme.light,
      routerConfig: _rootRouter.config(),
      localizationsDelegates: const [
        AppLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }

  @override
  void dispose() {
    _rootRouter.dispose();
    super.dispose();
  }
}
