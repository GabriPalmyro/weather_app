import 'package:cloudwalk_challenge/app/commons/own_theme/core/theme/own_theme.dart';
import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({required this.onTap, required this.index, Key? key}) : super(key: key);

  final int index;
  final Function(int) onTap;

  static const double iconSize = 28;

  @override
  Widget build(BuildContext context) {
    final theme = OwnTheme.getDesignTokensOf(context);

    Color colorButton(int indexB) => indexB == index ? theme.colors.white : theme.colors.white.withOpacity(0.15);

    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      decoration: BoxDecoration(
        color: theme.colors.grey,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            icon: const Icon(
              Icons.home_rounded,
              size: iconSize,
            ),
            onPressed: () => onTap(0),
            color: colorButton(0),
          ),
          IconButton(
            icon: const Icon(
              Icons.search_rounded,
              size: iconSize,
            ),
            onPressed: () => onTap(1),
            color: colorButton(1),
          ),
          IconButton(
            icon: const Icon(
              Icons.my_location_rounded,
              size: iconSize,
            ),
            onPressed: () => onTap(2),
            color: colorButton(2),
          ),
        ],
      ),
    );
  }
}
