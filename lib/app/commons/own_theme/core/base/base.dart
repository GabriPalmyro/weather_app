
import 'package:cloudwalk_challenge/app/commons/own_theme/core/base/design/borders.dart';
import 'package:cloudwalk_challenge/app/commons/own_theme/core/base/design/colors.dart';
import 'package:cloudwalk_challenge/app/commons/own_theme/core/base/design/font.dart';
import 'package:cloudwalk_challenge/app/commons/own_theme/core/base/design/spacing.dart';
import 'package:cloudwalk_challenge/app/commons/own_theme/core/theme/own_theme.dart';
import 'package:cloudwalk_challenge/app/commons/own_theme/core/tokens/design.dart';
import 'package:cloudwalk_challenge/app/commons/own_theme/core/tokens/design/borders.dart';
import 'package:cloudwalk_challenge/app/commons/own_theme/core/tokens/design/colors.dart';
import 'package:cloudwalk_challenge/app/commons/own_theme/core/tokens/design/font.dart';
import 'package:cloudwalk_challenge/app/commons/own_theme/core/tokens/design/spacing.dart';
class BaseOwnThemeDesignToken implements OwnThemeDesignTokens {
  @override
  final OwnThemeColor colors = BaseOwnThemeColor();

  @override
  final OwnThemeFont font = BaseOwnThemeFont();

  @override
  OwnThemeBorderWidth get borderWidth => BaseOwnThemeBorderWidth();

  @override
  OwnThemeBorder get borders => BaseOwnThemeBorder();

  @override
  OwnThemeSpacing get spacing => BaseOwnThemeSpacing();
}

class BaseOwnThemeData implements OwnThemeData {
  @override
  OwnThemeDesignTokens get designTokens => BaseOwnThemeDesignToken();

  @override
  String get name => 'base';
  
}