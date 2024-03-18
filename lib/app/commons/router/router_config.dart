import 'package:cloudwalk_challenge/app/commons/router/page_route.dart';
import 'package:cloudwalk_challenge/app/commons/router/routes.dart';
import 'package:cloudwalk_challenge/app/commons/router/widgets/not_found_page.dart';
import 'package:flutter/widgets.dart' hide PageRoute;
import 'package:go_router/go_router.dart';

class AppRouterConfig extends GoRouter {
  AppRouterConfig({
    required this.routes,
  }) : 
        super(
          initialLocation: Routes.splash.path,
          routes: routes
            .map<GoRoute>((PageRoute route) => route.toGoRoute())
            .toList(),
          errorBuilder: (context, state) => NotFoundPage(),
          redirect: (BuildContext context, GoRouterState state) => null,
        );

  final List<PageRoute> routes;
}
