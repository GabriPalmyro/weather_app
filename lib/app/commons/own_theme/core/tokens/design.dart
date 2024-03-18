import 'package:cloudwalk_challenge/app/commons/own_theme/core/tokens/design/borders.dart';
import 'package:cloudwalk_challenge/app/commons/own_theme/core/tokens/design/colors.dart';
import 'package:cloudwalk_challenge/app/commons/own_theme/core/tokens/design/font.dart';
import 'package:cloudwalk_challenge/app/commons/own_theme/core/tokens/design/spacing.dart';

abstract class OwnThemeDesignTokens {
  OwnThemeDesignTokens({
    required this.colors,
    required this.font,
    required this.spacing,
    required this.borderWidth,
    required this.borders,
  });

  final OwnThemeBorder borders;
  final OwnThemeColor colors;
  final OwnThemeFont font;
  final OwnThemeSpacing spacing;
  final OwnThemeBorderWidth borderWidth;
}
