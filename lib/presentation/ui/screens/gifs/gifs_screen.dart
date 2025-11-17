import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:provider/provider.dart';
import 'package:test_giphy_app/domain/models/gif.dart';
import 'package:test_giphy_app/presentation/ui/screens/gifs/bloc/gifs_cubit.dart';
import 'package:test_giphy_app/presentation/ui/screens/gifs/bloc/gifs_state.dart';
import 'package:test_giphy_app/presentation/ui/screens/gifs/components/gif_list_widget.dart';
import 'package:test_giphy_app/presentation/ui/screens/gifs/components/gifs_search_bar.dart';
import 'package:test_giphy_app/presentation/ui/screens/gifs/dependencies/gifs_screen_dependencies.dart';

@RoutePage()
class GifsScreen extends StatelessWidget implements AutoRouteWrapper {
  const GifsScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => GifsScreenDependencies(child: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                sliver: Selector<GifsCubit, TextEditingController>(
                  selector: (context, cubit) => cubit.searchController,
                  builder: (context, controller, child) => GifsSearchBar(
                    searchController: controller,
                    onSwitchAnimation: context.read<GifsCubit>().setAnimationMode,
                  ),
                ),
              ),
              Selector<GifsCubit, PagingController<int, Gif>>(
                selector: (context, cubit) => cubit.pagingController,
                builder: (context, controller, child) {
                  return BlocSelector<GifsCubit, GifsState, bool>(
                    selector: (state) => state.isAnimationEnabled,
                    builder: (context, isAnimationEnabled) {
                      return GifListWidget(
                        controller: controller,
                        animateGifs: isAnimationEnabled,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
