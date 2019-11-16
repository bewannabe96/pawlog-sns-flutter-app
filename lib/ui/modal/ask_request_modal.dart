import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:pawlog/model/model.dart';

import 'package:pawlog/ui/widget/pet_page_view.dart';
import 'package:pawlog/ui/component/pl_spinner.dart';

enum AskRequestActions {
  Sending,
  Receiving,
}

enum AskRequestResponses {
  Accept,
  Reject,
  Cancel,
}

class AskRequestModal extends ModalRoute<AskRequestResponses> {
  AskRequestModal(this.requstAction);

  final AskRequestActions requstAction;

  @override
  Duration get transitionDuration => Duration(milliseconds: 500);

  @override
  bool get opaque => false;

  @override
  bool get barrierDismissible => false;

  @override
  Color get barrierColor => const Color(0xFF37261E).withOpacity(0.95);

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
    return SafeArea(
      child: Center(
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
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'John Cena',
                  style: const TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                ),
                Text(
                  requstAction == AskRequestActions.Sending
                      ? 'asking for meetup'
                      : 'asking you to meetup',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white38,
                  ),
                ),
              ],
            ),
            PetPageView(
              [
                Pet(
                  'Dexter',
                  'Golden Retriever',
                  'https://images.pexels.com/photos/356378/pexels-photo-356378.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                ),
                Pet(
                  'Dexter',
                  'Golden Retriever',
                  'https://image.cnbcfm.com/api/v1/image/105992231-1561667465295gettyimages-521697453.jpeg?v=1561667497&w=678&h=381',
                ),
                Pet(
                  'Dexter',
                  'Golden Retriever',
                  'https://www.petmd.com/sites/default/files/Acute-Dog-Diarrhea-47066074.jpg',
                ),
              ],
              height: MediaQuery.of(context).size.width * 0.8,
              margin: const EdgeInsets.symmetric(vertical: 20),
              borderRadius: BorderRadius.circular(15),
            ),
            _buildActions(context),
          ],
        ),
      ),
    );
  }

  Widget _buildActions(BuildContext context) {
    return requstAction == AskRequestActions.Sending
        ? Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  const Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: const PLSpinner(
                      color: Colors.white70,
                    ),
                  ),
                  const Text(
                    'Waiting for response...',
                    style: const TextStyle(
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: FlatButton(
                  onPressed: () =>
                      Navigator.of(context).pop(AskRequestResponses.Cancel),
                  child: const Text(
                    'Cancel',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  color: Theme.of(context).colorScheme.error,
                  splashColor: Colors.white24,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 13, horizontal: 40),
                ),
              )
            ],
          )
        : Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 80,
                  height: 80,
                  margin: const EdgeInsets.only(right: 60),
                  child: FlatButton(
                    onPressed: () =>
                        Navigator.of(context).pop(AskRequestResponses.Accept),
                    child: const Icon(
                      FontAwesomeIcons.check,
                      size: 40,
                      color: Colors.white,
                    ),
                    color: const Color(0xFF6FB771),
                    splashColor: Colors.white24,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
                Container(
                  width: 80,
                  height: 80,
                  child: FlatButton(
                    onPressed: () =>
                        Navigator.of(context).pop(AskRequestResponses.Reject),
                    child: const Icon(
                      FontAwesomeIcons.times,
                      size: 40,
                      color: Colors.white,
                    ),
                    color: Theme.of(context).colorScheme.error,
                    splashColor: Colors.white24,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
