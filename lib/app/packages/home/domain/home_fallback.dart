import 'package:cloudwalk_challenge/app/packages/home/domain/interfaces/home_loader.dart';
import 'package:cloudwalk_challenge/app/packages/home/domain/model/city_weather.dart';

class HomeFallback implements HomeLoader {
  HomeFallback({
    required HomeLoader primaryLoader,
    required HomeLoader secondaryLoader,
  })  : _primaryLoader = primaryLoader,
        _secondaryLoader = secondaryLoader;

  final HomeLoader _primaryLoader;
  final HomeLoader _secondaryLoader;

  @override
  Future<CityWeather> load() async {
    try {
      return await _primaryLoader.load();
    } catch (e) {
      return await _secondaryLoader.load();
    }
  }
}
