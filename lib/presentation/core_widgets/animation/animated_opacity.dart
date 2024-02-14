import 'package:flutter/material.dart';

class KAnimatedOpacity extends StatelessWidget {
  final Widget child;
  final Animation<double> animation;

  const KAnimatedOpacity({
    Key? key,
    required this.animation,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: animation,
      child: child,
    );
  }
}
