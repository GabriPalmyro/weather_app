import 'dart:convert';

import 'package:cloudwalk_challenge/app/commons/local_database/local_database.dart';
import 'package:cloudwalk_challenge/app/packages/home/domain/interfaces/home_loader.dart';
import 'package:cloudwalk_challenge/app/packages/home/domain/interfaces/home_store.dart';
import 'package:cloudwalk_challenge/app/packages/home/domain/model/city_weather.dart';
import 'package:cloudwalk_challenge/app/utils/app_strings.dart';


class HomeCacheImpl implements HomeLoader, HomeStore {
  HomeCacheImpl({
    required LocalDatabase localDatabase,
  }) : _localDatabase = localDatabase;

  final LocalDatabase _localDatabase;

  @override
  Future<CityWeather> load() async {
    final cityWeatherJson = jsonDecode(await _localDatabase.getData(AppStrings.cityWeatherKey));
    return CityWeather.fromJson(cityWeatherJson);
  }

  @override
  Future<void> save(CityWeather cityWeather) async {
    await _localDatabase.saveData(
      AppStrings.cityWeatherKey,
      jsonEncode(cityWeather.toJson()),
    );
  }
}
