
import 'package:cloudwalk_challenge/app/commons/router/page_route.dart';
import 'package:cloudwalk_challenge/app/commons/router/router_config.dart';
import 'package:cloudwalk_challenge/app/di/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit(initializerName: r'$initAppGetIt')
Future<void> configureAppDependencies(
  GetIt getIt,
  List<PageRoute> routes,
) async {
  getIt.$initAppGetIt();

  getIt.registerLazySingleton<AppRouterConfig>(
    () => AppRouterConfig(
      routes: routes,
    ),
  );
}

