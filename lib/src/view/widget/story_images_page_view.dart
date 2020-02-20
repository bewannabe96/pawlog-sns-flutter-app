import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:pawlog/src/view/widget/page_indicator.dart';

class ImagesPageView extends StatefulWidget {
  final List<String> imageUrls;

  const ImagesPageView(
    this.imageUrls,
  );

  _ImagesPageViewState createState() => _ImagesPageViewState();
}

class _ImagesPageViewState extends State<ImagesPageView> {
  final PageController _pageController = PageController();

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
            itemBuilder: (BuildContext context, int index) =>
                _ImageOverlay(imageUrl: widget.imageUrls[index]),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: widget.imageUrls.length > 1
                ? PLPageIndicator(
                    controller: _pageController,
                    count: widget.imageUrls.length,
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}

class _ImageOverlay extends StatelessWidget {
  final String imageUrl;

  const _ImageOverlay({
    @required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => ShaderMask(
        blendMode: BlendMode.multiply,
        shaderCallback: (rect) => LinearGradient(
          begin: Alignment.center,
          end: Alignment.bottomCenter,
          colors: [Colors.white, Colors.grey],
        ).createShader(
          Rect.fromLTRB(0, 0, rect.width, rect.height),
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: imageProvider,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
