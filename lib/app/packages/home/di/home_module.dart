import 'package:cloudwalk_challenge/app/commons/network/network_provider.dart';
import 'package:cloudwalk_challenge/app/packages/home/data/service/home_service.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppHomeModule {
  HomeService providesService(
    NetworkProvider networkProvider,
  ) =>
      HomeServiceImpl(
        networkProvider: networkProvider,
      );
}
