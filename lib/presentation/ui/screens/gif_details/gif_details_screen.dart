import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:test_giphy_app/domain/models/gif.dart';
import 'package:test_giphy_app/presentation/ui/screens/gif_details/components/gif_body/gif_body_widget.dart';
import 'package:test_giphy_app/presentation/ui/screens/gif_details/components/gif_details_app_bar.dart';
import 'package:test_giphy_app/presentation/ui/screens/gif_details/dependencies/gif_details_dependencies.dart';

@RoutePage()
class GifDetailsScreen extends StatelessWidget implements AutoRouteWrapper {
  final String? id;
  final Gif? gif;

  GifDetailsScreen({
    @pathParam String? id,
    this.gif,
    super.key,
  }) : assert(
         id != null || gif != null,
         'Either id or gif must be provided',
       ),
       id = gif?.id ?? id;

  @override
  Widget wrappedRoute(BuildContext context) => GifDetailsDependencies(
    gifId: id,
    gif: gif,
    child: this,
  );

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            GifDetailsAppBar(),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 12,
              ),
              sliver: SliverToBoxAdapter(
                child: GifBodyWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
