import 'package:cloudwalk_challenge/app/packages/home/data/service/home_service.dart';
import 'package:cloudwalk_challenge/app/packages/home/data/service/locator_service.dart';
import 'package:cloudwalk_challenge/app/packages/home/domain/interfaces/home_loader.dart';
import 'package:cloudwalk_challenge/app/packages/home/domain/interfaces/home_store.dart';
import 'package:cloudwalk_challenge/app/packages/home/domain/model/city_weather.dart';

class HomeRepositoryImpl implements HomeLoader {
  HomeRepositoryImpl({
    required HomeService homeService,
    required LocatorService locatorService,
    required HomeStore homeStore,
  })  : _homeService = homeService,
        _locatorService = locatorService,
        _homeStore = homeStore;

  final HomeService _homeService;
  final LocatorService _locatorService;
  final HomeStore _homeStore;

  @override
  Future<CityWeather> load() async {
    final position = await _locatorService.getCurrentLocation();
    final cityWeather = await _homeService.load(
      lat: position['lat'],
      lon: position['lon'],
    );

    try {
      _homeStore.save(cityWeather);
    } catch (_) {}

    return cityWeather;
  }
}
