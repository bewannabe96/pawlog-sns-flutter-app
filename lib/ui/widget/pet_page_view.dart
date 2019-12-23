import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pawlog/bloc/bloc.dart';
import 'package:pawlog/model/model.dart';

import 'package:pawlog/ui/component/pl_image_overlay.dart';
import 'package:pawlog/ui/component/pl_page_indicator.dart';

class PetPageView extends StatefulWidget {
  final List<Pet> pets;

  final double height;
  final EdgeInsetsGeometry margin;
  final BorderRadius borderRadius;

  PetPageView(
    this.pets, {
    this.height = double.infinity,
    this.margin,
    this.borderRadius = BorderRadius.zero,
  });

  _PetPageViewState createState() => _PetPageViewState();
}

class _PetPageViewState extends State<PetPageView> {
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
    final _syncConfigState = BlocProvider.of<SyncConfigBloc>(context).state;

    return Container(
      height: widget.height,
      margin: widget.margin,
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          ClipRRect(
            borderRadius: widget.borderRadius,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.pets.length,
              itemBuilder: (BuildContext context, int index) => PLImageOverlay(
                imageUrl: widget.pets[index].imageURL,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        widget.pets[index].name,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 4),
                        child: Text(
                          _syncConfigState is ConfigLoadedState
                              ? _syncConfigState.config
                                  .breedTypes[widget.pets[index].breed].title
                              : '',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.black26,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: PLPageIndicator(
              controller: _pageController,
              count: widget.pets.length,
            ),
          ),
        ],
      ),
    );
  }
}
