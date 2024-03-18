import 'package:cloudwalk_challenge/app/commons/own_theme/core/theme/own_theme.dart';
import 'package:flutter/material.dart';

class HomePageError extends StatelessWidget {
  const HomePageError({required this.onRetry, super.key});

  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    final tokens = OwnTheme.getDesignTokensOf(context);
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Ocorreu um erro',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: tokens.font.size.md,
              fontFamily: tokens.font.family.base,
              fontWeight: tokens.font.weight.bold,
              color: tokens.colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: tokens.spacing.inline.xs,
            ),
            child: Text(
              'Ocorreu um problema ao carregar os dados.\nPor favor, tente novamente.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: tokens.font.size.xxs,
                fontFamily: tokens.font.family.base,
                fontWeight: tokens.font.weight.light,
                color: tokens.colors.white,
              ),
            ),
          ),
          SizedBox(height: tokens.spacing.inline.xs),
          ElevatedButton(
            onPressed: onRetry,
            style: ElevatedButton.styleFrom(
              backgroundColor: tokens.colors.secondary,
              padding: EdgeInsets.symmetric(
                vertical: tokens.spacing.inline.xs,
                horizontal: tokens.spacing.inline.sm,
              ),
            ),
            child: Text(
              'Tentar novamente',
              style: TextStyle(
                fontSize: tokens.font.size.xs,
                fontFamily: tokens.font.family.base,
                color: tokens.colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
