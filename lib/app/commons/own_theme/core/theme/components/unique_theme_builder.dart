import 'package:cloudwalk_challenge/app/commons/own_theme/core/theme/own_theme.dart';
import 'package:cloudwalk_challenge/app/commons/own_theme/core/theme/unique_theme_manager.dart';
import 'package:flutter/widgets.dart';

class UniqueThemeBuilder extends StatelessWidget {
  const UniqueThemeBuilder({required this.uniqueThemeManager, required this.child, super.key});
  final UniqueThemeManager uniqueThemeManager;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<OwnThemeData>(
      future: uniqueThemeManager.getAppTheme(),
      builder: (context, theme) => OwnTheme(
        data: theme.data!,
        child: child,
      ),
    );
  }
}
