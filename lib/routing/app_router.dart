import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:test_giphy_app/routing/app_router.gr.dart';
import 'package:test_giphy_app/routing/constants/routes.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Popup,Page')
@singleton
class AppRouter extends RootStackRouter {
  AppRouter();

  @override
  RouteType get defaultRouteType => const RouteType.adaptive();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      path: Locations.gifs,
      page: GifsPage.page,
      initial: true,
    ),
    AutoRoute(
      path: Locations.gifDetails,
      page: GifDetailsPage.page,
    ),
    RedirectRoute(
      path: '*',
      redirectTo: Locations.gifs,
    ),
  ];
}
