import 'package:cloudwalk_challenge/app/commons/own_theme/core/theme/own_theme.dart';
import 'package:cloudwalk_challenge/app/commons/router/app_routes.dart';
import 'package:cloudwalk_challenge/app/commons/router/router_config.dart';
import 'package:cloudwalk_challenge/app/di/injection.dart';
import 'package:cloudwalk_challenge/app/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final GetIt getIt = GetIt.instance;

  await configureAppDependencies(getIt, routes);

  final OwnThemeData theme = OwnThemeAppData();

  runApp(MyApp(theme: theme));
}

class MyApp extends StatefulWidget {
  const MyApp({required this.theme, super.key});

  final OwnThemeData theme;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouterConfig router = GetIt.I();
  
  @override
  Widget build(BuildContext context) {
    return OwnTheme(
      data: widget.theme,
      child: MaterialApp.router(
        theme: ThemeData(
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: {
              TargetPlatform.android: CupertinoPageTransitionsBuilder(),
              TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            },
          ),
        ),
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('pt', ''),
        ],
        debugShowCheckedModeBanner: false,
        routerConfig: router,
        title: AppStrings.title,
      ),
    );
  }
}
