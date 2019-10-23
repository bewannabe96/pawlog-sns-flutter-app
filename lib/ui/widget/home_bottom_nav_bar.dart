import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeBottomNavBar extends StatelessWidget {
  const HomeBottomNavBar({
    this.currentIndex,
    this.onTap,
  });

  final int currentIndex;
  final Function onTap;

  final _pages = const {
    0: {
      "icon": FontAwesomeIcons.home,
    },
    1: {
      "icon": FontAwesomeIcons.solidNewspaper,
    },
    2: {
      "icon": FontAwesomeIcons.users,
    },
    3: {
      "icon": FontAwesomeIcons.solidComments,
    },
    4: {
      "icon": FontAwesomeIcons.solidUserCircle,
    },
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).padding.bottom + 56,
      width: double.infinity,
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom),
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 0.5)]),
      child: Row(
        children: _pages.keys
            .map(
              (pageIndex) => Expanded(
                child: IconButton(
                  onPressed: () => onTap(pageIndex),
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  icon: Icon(
                    _pages[pageIndex]['icon'],
                    color: pageIndex == currentIndex
                        ? Theme.of(context).colorScheme.primary
                        : Colors.grey[400],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
