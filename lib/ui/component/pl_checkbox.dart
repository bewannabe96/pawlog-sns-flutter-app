import 'package:flutter/material.dart';

class PLCheckbox extends StatefulWidget {
  const PLCheckbox({
    this.value,
  });

  final bool value;

  @override
  _PLCheckboxState createState() => _PLCheckboxState();
}

class _PLCheckboxState extends State<PLCheckbox>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );

    _animation = Tween(
      begin: 0.0,
      end: 1.0,
    ).animate(_controller);
  }

  @override
  dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double size = 25.0;

    widget.value ? _controller.forward() : _controller.reverse();

    return Container(
      width: size,
      height: size,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          width: 1.5,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
      child: FadeTransition(
        opacity: _animation,
        child: Center(
          child: Container(
            width: size * 0.5,
            height: size * 0.5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}
