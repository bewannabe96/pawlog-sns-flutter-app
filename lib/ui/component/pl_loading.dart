import 'package:flutter/material.dart';

class PLLoading extends StatelessWidget {
  const PLLoading();

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(
        Theme.of(context).colorScheme.primary,
      ),
      backgroundColor: Theme.of(context).colorScheme.secondary,
      strokeWidth: 3.5,
    );
  }
}
