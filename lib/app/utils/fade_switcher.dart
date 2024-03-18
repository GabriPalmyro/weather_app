import 'package:flutter/material.dart';

class FadeSwitcher extends StatelessWidget {
  const FadeSwitcher({required this.child, super.key});
  
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      transitionBuilder: (child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      layoutBuilder: (currentChild, previousChildren) {
        return Stack(
          children: [
            ...previousChildren,
            if (currentChild != null) currentChild,
          ],
        );
      },
    );
  }
}
