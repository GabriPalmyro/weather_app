
import 'package:cloudwalk_challenge/app/packages/home/domain/model/city_weather.dart';
import 'package:cloudwalk_challenge/app/packages/search/data/service/search_service.dart';

abstract class SearchRepository {
  Future<CityWeather> load({
    required String lat,
    required String lon,
  });
}

class SearchRepositoryImpl implements SearchRepository {
  SearchRepositoryImpl({required SearchService searchService}) : _searchService = searchService;

  final SearchService _searchService;

  @override
  Future<CityWeather> load({
    required String lat,
    required String lon,
  }) async =>
      _searchService.load(lat: lat, lon: lon);
}
