import 'package:flutter/material.dart';

import 'package:pawlog/src/style.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(
      valueColor: const AlwaysStoppedAnimation<Color>(primaryColor),
      backgroundColor: lightSecondaryColor,
      strokeWidth: 3.5,
    );
  }
}
