import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';

class PLPageIndicator extends StatelessWidget {
  const PLPageIndicator({
    @required this.controller,
    @required this.count,
  });

  final PageController controller;
  final int count;

  @override
  Widget build(BuildContext context) {
    return PageIndicator(
      layout: PageIndicatorLayout.WARM,
      controller: controller,
      count: count,
      size: 8.0,
      space: 10.0,
      color: Colors.grey[200],
      activeColor: Theme.of(context).colorScheme.primary,
    );
  }
}
