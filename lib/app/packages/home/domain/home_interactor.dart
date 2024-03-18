import 'package:cloudwalk_challenge/app/packages/home/domain/interfaces/home_loader.dart';
import 'package:cloudwalk_challenge/app/packages/home/domain/model/city_weather.dart';

abstract class HomeInteractor {
  Future<CityWeather> getCurrentWeather();
}

class HomeInteractorImpl implements HomeInteractor {
  HomeInteractorImpl({
    required HomeLoader loader,
  }) : _loader = loader;

  final HomeLoader _loader;

  @override
  Future<CityWeather> getCurrentWeather() async {
    return await _loader.load();
  }
}
