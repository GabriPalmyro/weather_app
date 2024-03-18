import 'package:cloudwalk_challenge/app/packages/home/domain/model/city_weather.dart';
import 'package:cloudwalk_challenge/app/packages/search/data/repository/search_repository.dart';
import 'package:cloudwalk_challenge/app/utils/app_utils.dart';

abstract class SearchInteractor {
  Future<List<CityWeather>> getCitiesWeathers();
}

class SearchInteractorImpl implements SearchInteractor {
  SearchInteractorImpl(this.searchRepository);

  final SearchRepository searchRepository;

  @override
  Future<List<CityWeather>> getCitiesWeathers() async {
    final cityWeathers = <CityWeather>[];
    for (var city in Cities.values) {
      cityWeathers.add(await searchRepository.load(lat: city.lat, lon: city.lon));
    }
    return cityWeathers;
  }
}
