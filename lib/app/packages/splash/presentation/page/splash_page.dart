import 'package:cloudwalk_challenge/app/commons/own_theme/core/theme/own_theme.dart';
import 'package:cloudwalk_challenge/app/commons/router/app_navigator.dart';
import 'package:cloudwalk_challenge/app/commons/router/routes.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({required this.navigator, super.key});
  final AppNavigator navigator;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      widget.navigator.push(route: Routes.home);
    });
  }

  @override
  Widget build(BuildContext context) {
    final tokens = OwnTheme.getDesignTokensOf(context);
    return Scaffold(
      backgroundColor: tokens.colors.grey,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/foreground.png'),
            SizedBox(height: tokens.spacing.inline.md),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
