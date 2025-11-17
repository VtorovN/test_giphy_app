import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_giphy_app/presentation/ui/screens/gifs/bloc/gifs_cubit.dart';
import 'package:test_giphy_app/service_locator/injection.dart';

class GifsScreenDependencies extends StatelessWidget {
  final Widget child;

  const GifsScreenDependencies({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GifsCubit>(
      create: (_) => locator<GifsCubit>(),
      child: child,
    );
  }
}
