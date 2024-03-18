import 'package:cloudwalk_challenge/app/commons/own_theme/core/base/base.dart';
import 'package:cloudwalk_challenge/app/commons/own_theme/core/tokens/design.dart';
import 'package:flutter/material.dart';

abstract class OwnThemeData {
  OwnThemeData({
    required this.designTokens,
    required this.name,
  });

  final OwnThemeDesignTokens designTokens;
  final String name;
}

class OwnThemeAppData implements OwnThemeData {
  @override
  OwnThemeDesignTokens get designTokens => BaseOwnThemeDesignToken();

  @override
  String get name => 'base';
}

typedef OwnThemeChangeCallback = Function(OwnThemeData);

class OwnTheme extends InheritedWidget {
  const OwnTheme({
    required super.child,
    required this.data,
    this.changeCallback,
    super.key,
  });

  final OwnThemeData data;
  final OwnThemeChangeCallback? changeCallback;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    if (oldWidget is OwnTheme) {
      return oldWidget.data != data;
    }
    return false;
  }

  static void changeOwnThemeData(BuildContext context, OwnThemeData data) {
    final OwnTheme? result = context.dependOnInheritedWidgetOfExactType<OwnTheme>();
    if (result?.changeCallback case final callback?) {
      callback(data);
    }
  }

  static OwnThemeDesignTokens getDesignTokensOf(BuildContext context) {
    final OwnTheme? result = context.dependOnInheritedWidgetOfExactType<OwnTheme>();
    assert(result != null, 'No OwnTheme found in context');
    return result!.data.designTokens;
  }
}
