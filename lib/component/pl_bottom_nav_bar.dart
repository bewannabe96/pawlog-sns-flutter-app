import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PLBottomNavBar extends StatelessWidget {
  const PLBottomNavBar({
    this.currentIndex,
    this.onTap,
  });

  final int currentIndex;
  final Function onTap;

  final _pages = const {
    0: {
      "icon": FontAwesomeIcons.compass,
    },
    1: {
      "icon": FontAwesomeIcons.users,
    },
    2: {
      "icon": FontAwesomeIcons.comments,
    },
    3: {
      "icon": FontAwesomeIcons.userCircle,
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
            .map((pageIndex) => Expanded(
                  child: IconButton(
                    onPressed: () => onTap(pageIndex),
                    splashColor: Colors.transparent,
                    icon: Icon(_pages[pageIndex]['icon'],
                        color: pageIndex == currentIndex
                            ? Colors.grey[800]
                            : Colors.grey[400]),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
