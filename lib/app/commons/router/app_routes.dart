import 'package:cloudwalk_challenge/app/commons/router/app_navigator.dart';
import 'package:cloudwalk_challenge/app/commons/router/page_route.dart';
import 'package:cloudwalk_challenge/app/commons/router/routes.dart';
import 'package:cloudwalk_challenge/app/packages/dash_tab/presentation/bloc/connection_status_cubit.dart';
import 'package:cloudwalk_challenge/app/packages/dash_tab/presentation/dash_tab_page.dart';
import 'package:cloudwalk_challenge/app/packages/home/composer/home_composer.dart';
import 'package:cloudwalk_challenge/app/packages/search/presentation/bloc/search_cubit.dart';
import 'package:cloudwalk_challenge/app/packages/search/presentation/page/search_page.dart';
import 'package:cloudwalk_challenge/app/packages/splash/presentation/page/splash_page.dart';
import 'package:get_it/get_it.dart';

final routes = [
  PageRoute(
    route: Routes.splash,
    builder: (context, state) => SplashPage(
      navigator: GetIt.I.get<AppNavigator>(),
    ),
  ),
  PageRoute(
    route: Routes.home,
    builder: (context, state) => DashTabPage(
      connectionCubit: GetIt.I.get<ConnectionStatusCubit>(),
      views: [
        HomeComposer.compose(),
        SearchPage(
          cubit: GetIt.I.get<SearchCubit>(),
        ),
        SearchPage(
          cubit: GetIt.I.get<SearchCubit>(),
        ),
      ],
    ),
  ),
];
