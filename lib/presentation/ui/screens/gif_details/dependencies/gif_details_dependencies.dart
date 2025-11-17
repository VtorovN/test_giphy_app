import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_giphy_app/domain/models/gif.dart';
import 'package:test_giphy_app/presentation/ui/screens/gif_details/bloc/gif_details_cubit.dart';
import 'package:test_giphy_app/service_locator/injection.dart';

class GifDetailsDependencies extends StatelessWidget {
  final Widget child;
  final String? gifId;
  final Gif? gif;

  const GifDetailsDependencies({
    super.key,
    required this.child,
    this.gifId,
    this.gif,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => locator<GifDetailsCubit>(
        param1: gifId,
        param2: gif,
      ),
      child: child,
    );
  }
}
