import 'package:cloudwalk_challenge/app/commons/own_theme/core/theme/own_theme.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerComponent extends StatelessWidget {
  const ShimmerComponent({required this.width, required this.height});
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final theme = OwnTheme.getDesignTokensOf(context);
    return Shimmer.fromColors(
      baseColor: theme.colors.secondary,
      highlightColor: theme.colors.secondary.withOpacity(0.6),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            theme.borders.radius.medium,
          ),
          color: theme.colors.grey,
        ),
      ),
    );
  }
}
