import 'package:cloudwalk_challenge/app/commons/router/router_config.dart';
import 'package:cloudwalk_challenge/app/commons/router/routes.dart';
import 'package:injectable/injectable.dart';

class AppNavigator {
  Future<void> push({required Routes route}) async {}
}

@LazySingleton(as: AppNavigator)
class AppNavigatorImpl implements AppNavigator {
  AppNavigatorImpl(this.navigator);
  final AppRouterConfig navigator;

  @override
  Future<void> push({required Routes route}) async => navigator.pushNamed(route.name);
}
