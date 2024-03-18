import 'package:cloudwalk_challenge/app/packages/home/domain/model/city_weather.dart';

abstract class HomeLoader {
  Future<CityWeather> load();
}