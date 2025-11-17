import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_giphy_app/presentation/ui/components/default_error_widget.dart';
import 'package:test_giphy_app/presentation/ui/enums/screen_size.dart';
import 'package:test_giphy_app/presentation/ui/screens/gif_details/bloc/gif_details_cubit.dart';
import 'package:test_giphy_app/presentation/ui/screens/gif_details/bloc/gif_details_state.dart';
import 'package:test_giphy_app/presentation/ui/screens/gif_details/components/gif_body/components/gif_descriptors_widget.dart';
import 'package:test_giphy_app/presentation/ui/screens/gif_details/components/gif_body/components/gif_view_widget.dart';
import 'package:test_giphy_app/presentation/ui/screens/gifs/components/default_progress_indicator.dart';

class GifBodyWidget extends StatelessWidget {
  const GifBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.sizeOf(context);

    return BlocBuilder<GifDetailsCubit, GifDetailsState>(
      builder: (context, state) {
        return switch (state) {
          GifDetailsLoading() || GifDetailsInitial() => const DefaultProgressIndicator(),
          GifDetailsError(:final error) => DefaultErrorWidget(
            error: error,
            onRetry: context.read<GifDetailsCubit>().loadGifDetails,
            iconSize: 64,
            fontSize: 32,
          ),
          GifDetailsLoaded(:final gif) => SingleChildScrollView(
            primary: false,
            physics: const NeverScrollableScrollPhysics(),
            child: Builder(
              builder: (context) {
                final children = [
                  Center(
                    child: GifViewWidget(gif: gif),
                  ),
                  const SizedBox.square(dimension: 20),
                  Flexible(
                    child: GifDescriptorsWidget(gif: gif),
                  ),
                ];

                return switch (ScreenSize.fromSize(screenSize)) {
                  ScreenSize.small => Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: children,
                  ),
                  _ => Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: children,
                  ),
                };
              },
            ),
          ),
        };
      },
    );
  }
}
