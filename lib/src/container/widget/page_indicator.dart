import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';

import 'package:pawlog/src/style.dart';

class PLPageIndicator extends StatelessWidget {
  final PageController controller;
  final int count;

  const PLPageIndicator({
    @required this.controller,
    @required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return PageIndicator(
      layout: PageIndicatorLayout.WARM,
      controller: controller,
      count: count,
      size: 8.0,
      space: 10.0,
      color: lightSecondaryColor,
      activeColor: primaryColor,
    );
  }
}
