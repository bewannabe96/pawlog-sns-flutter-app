import 'package:flutter/material.dart';

import 'package:pawlog/ui/component/pl_image_overlay.dart';
import 'package:pawlog/ui/component/pl_page_indicator.dart';

class StoryImagesPageView extends StatefulWidget {
  const StoryImagesPageView(
    this.imageUrls,
  );

  final List<String> imageUrls;

  _StoryImagesPageViewState createState() => _StoryImagesPageViewState();
}

class _StoryImagesPageViewState extends State<StoryImagesPageView> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width * 0.7,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          PageView.builder(
            controller: _pageController,
            itemCount: widget.imageUrls.length,
            itemBuilder: (BuildContext context, int index) => PLImageOverlay(
              imageUrl: widget.imageUrls[index],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: PLPageIndicator(
              controller: _pageController,
              count: widget.imageUrls.length,
            ),
          ),
        ],
      ),
    );
  }
}
