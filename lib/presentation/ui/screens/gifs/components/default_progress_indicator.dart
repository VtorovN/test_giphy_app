import 'package:flutter/material.dart';

class DefaultProgressIndicator extends StatelessWidget {
  const DefaultProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
