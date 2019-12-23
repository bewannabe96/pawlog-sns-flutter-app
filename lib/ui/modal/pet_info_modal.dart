import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pawlog/bloc/bloc.dart';
import 'package:pawlog/model/model.dart';

class PetInfoModal extends ModalRoute<void> {
  final Pet pet;

  PetInfoModal(this.pet);

  @override
  Duration get transitionDuration => Duration(milliseconds: 300);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => true;

  @override
  Color get barrierColor => const Color(0xFF0D0C0C).withOpacity(0.85);

  @override
  String get barrierLabel => null;

  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
  ) {
    return Center(
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.0, 1.0),
          end: Offset.zero,
        ).animate(
          animation.drive(
            CurveTween(curve: Curves.fastLinearToSlowEaseIn),
          ),
        ),
        child: FadeTransition(
          opacity: animation,
          child: _buildContent(context),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final _modalWidth = MediaQuery.of(context).size.width * 0.3;
    final _syncConfigState = BlocProvider.of<SyncConfigBloc>(context).state;

    return Material(
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          CircleAvatar(
            radius: _modalWidth,
            backgroundColor: Colors.grey[350],
            backgroundImage: pet.imageURL == null ? null : null,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text(
              pet.name,
              style: const TextStyle(
                fontSize: 25.0,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            _syncConfigState is ConfigLoadedState
                ? _syncConfigState.config.breedTypes[pet.breed].title
                : '',
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.grey[400],
            ),
          ),
        ],
      ),
    );
  }
}
