import 'package:cloudwalk_challenge/app/commons/own_theme/components/shimmer/shimmer_component.dart';
import 'package:cloudwalk_challenge/app/commons/own_theme/core/theme/own_theme.dart';
import 'package:flutter/material.dart';

class HomePageLoading extends StatelessWidget {
  const HomePageLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = OwnTheme.getDesignTokensOf(context);
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: theme.spacing.inline.xxl),
          ShimmerComponent(width: width * 0.4, height: 30),
          SizedBox(height: theme.spacing.inline.sm),
          ShimmerComponent(width: width * 0.7, height: 50),
          SizedBox(height: theme.spacing.inline.sm),
          ShimmerComponent(width: width * 0.8, height: 200),
          SizedBox(height: theme.spacing.inline.sm),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: theme.spacing.inline.sm),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    ShimmerComponent(width: width * 0.2, height: 30),
                    SizedBox(height: theme.spacing.inline.xs),
                    ShimmerComponent(width: width * 0.2, height: 30),
                  ],
                ),
                SizedBox(width: theme.spacing.inline.sm),
                Column(
                  children: [
                    ShimmerComponent(width: width * 0.2, height: 30),
                    SizedBox(height: theme.spacing.inline.xs),
                    ShimmerComponent(width: width * 0.2, height: 30),
                  ],
                ),
                SizedBox(width: theme.spacing.inline.sm),
                Column(
                  children: [
                    ShimmerComponent(width: width * 0.2, height: 30),
                    SizedBox(height: theme.spacing.inline.xs),
                    ShimmerComponent(width: width * 0.2, height: 30),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: theme.spacing.inline.sm),
          for (int i = 0; i < 5; i++) ...{
            ShimmerComponent(width: width * 0.9, height: 80),
            SizedBox(height: theme.spacing.inline.xs),
          },
        ],
      ),
    );
  }
}
