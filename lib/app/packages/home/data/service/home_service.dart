import 'package:cloudwalk_challenge/app/commons/network/network_provider.dart';
import 'package:cloudwalk_challenge/app/packages/home/domain/model/city_weather.dart';
import 'package:cloudwalk_challenge/app/utils/app_strings.dart';

abstract class HomeService {
  Future<CityWeather> load({
    required String lat,
    required String lon,
  });
}

class HomeServiceImpl implements HomeService {
  HomeServiceImpl({required NetworkProvider networkProvider}) : _client = networkProvider;

  final NetworkProvider _client;

  @override
  Future<CityWeather> load({
    required String lat,
    required String lon,
  }) async {
    final dio = await _client.getNetworkInstanceForUrl(url: AppStrings.weatherService);

    final result = await dio.get(
      '/data/2.5/forecast',
      queryParameters: {
        'lat': lat,
        'lon': lon,
        'appid': AppStrings.weatherApiKey,
        'units': 'metric',
      },
    );
    return CityWeather.fromJson(result.data as Map<String, dynamic>);
  }
}
