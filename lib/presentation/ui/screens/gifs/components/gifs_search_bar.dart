import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_giphy_app/presentation/res/app_colors.dart';
import 'package:test_giphy_app/presentation/ui/components/default_sliver_app_bar.dart';
import 'package:test_giphy_app/presentation/ui/screens/gifs/bloc/gifs_cubit.dart';
import 'package:test_giphy_app/presentation/ui/screens/gifs/bloc/gifs_state.dart';
import 'package:test_giphy_app/utils/extensions/theme_extensions.dart';

class GifsSearchBar extends StatefulWidget {
  final TextEditingController searchController;
  final Function(bool) onSwitchAnimation;

  const GifsSearchBar({
    super.key,
    required this.searchController,
    required this.onSwitchAnimation,
  });

  @override
  State<GifsSearchBar> createState() => _GifsSearchBarState();
}

class _GifsSearchBarState extends State<GifsSearchBar> {
  final _focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;

    return DefaultSliverAppBar(
      automaticallyImplyLeading: false,
      shadowColor: theme.colorScheme.onSurface,
      title: SearchBar(
        focusNode: _focusNode,
        onTapOutside: (event) {
          _focusNode.unfocus();
        },
        controller: widget.searchController,
        leading: Icon(
          Icons.search,
          color: theme.iconTheme.color ?? AppColors.icon,
          size: 32,
        ),
        elevation: const WidgetStatePropertyAll(0),
        side: WidgetStateProperty.resolveWith<BorderSide?>(
          (Set<WidgetState> states) {
            if (states.contains(WidgetState.focused)) {
              return BorderSide(color: theme.primaryColor, width: 2);
            }

            return null;
          },
        ),
      ),
      actions: [
        BlocBuilder<GifsCubit, GifsState>(
          builder: (context, state) {
            return Switch.adaptive(
              value: state.isAnimationEnabled,
              onChanged: widget.onSwitchAnimation,
              activeTrackColor: context.colors.primary.withAlpha(30),
              thumbIcon: WidgetStateProperty.all<Icon>(
                Icon(
                  state.isAnimationEnabled ? Icons.play_arrow : Icons.pause,
                  color: context.colors.primary,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();

    super.dispose();
  }
}
