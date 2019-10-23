import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PLImageOverlay extends StatelessWidget {
  const PLImageOverlay({
    @required this.imageUrl,
    this.child,
  });

  final String imageUrl;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          ShaderMask(
            shaderCallback: (rect) {
              return LinearGradient(
                begin: Alignment.center,
                end: Alignment.bottomCenter,
                colors: [Colors.white, Colors.grey[600]],
              ).createShader(
                Rect.fromLTRB(0, 0, rect.width, rect.height),
              );
            },
            blendMode: BlendMode.multiply,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          child == null ? Container() : child,
        ],
      ),
    );
  }
}
