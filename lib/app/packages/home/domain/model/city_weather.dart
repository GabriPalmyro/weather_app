// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloudwalk_challenge/app/packages/home/domain/model/weather_type.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class CityWeather extends Equatable {
  const CityWeather({
    required this.cityName,
    required this.weather,
    required this.lastUpdated,
  });

  final String cityName;
  final List<Weather> weather;
  final DateTime lastUpdated;

  @override
  List<Object> get props => [cityName, weather, lastUpdated];

  CityWeather copyWith({
    String? cityName,
    List<Weather>? weather,
    DateTime? lastUpdated,
  }) {
    return CityWeather(
      cityName: cityName ?? this.cityName,
      weather: weather ?? this.weather,
      lastUpdated: lastUpdated ?? this.lastUpdated,
    );
  }

  factory CityWeather.fromJson(Map<String, dynamic> json) {
    final cityName = json['city']['name'];
    final weatherList = json['list'] as List<dynamic>;

    final Map<String, dynamic> uniqueDays = {};
    for (var item in weatherList) {
      final String date = DateFormat('yyyy-MM-dd').format(DateTime.parse(item['dt_txt']));
      if (!uniqueDays.containsKey(date)) {
        uniqueDays[date] = item;
      }
    }    

    final weather = uniqueDays.values.map((e) => Weather.fromMap(e)).toList();

    return CityWeather(
      cityName: cityName,
      weather: weather,
      lastUpdated: DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    final List<Map<String, dynamic>> weatherList = weather.map((e) => e.toMap()).toList();

    return {
      'city': {
        'name': cityName,
      },
      'list': weatherList,
    };
  }
}

class Weather extends Equatable {
  const Weather({
    required this.condition,
    required this.temp,
    required this.minTemp,
    required this.maxTemp,
    required this.windSpeed,
  });

  final WeatherCondition condition;
  final double temp;
  final double minTemp;
  final double maxTemp;
  final double windSpeed;

  @override
  List<Object> get props => [condition, temp, minTemp, maxTemp, windSpeed];

  factory Weather.fromMap(Map<String, dynamic> map) {
    final condition = WeatherCondition.fromString(map['weather'][0]['main'] as String);
    final main = map['main'] as Map<String, dynamic>;
    final wind = map['wind'] as Map<String, dynamic>;

    return Weather(
      condition: condition,
      temp: double.tryParse(main['temp'].toString()) ?? 0.0,
      minTemp: double.tryParse(main['temp_min'].toString()) ?? 0.0,
      maxTemp: double.tryParse(main['temp_max'].toString()) ?? 0.0,
      windSpeed: double.tryParse(wind['speed'].toString()) ?? 0.0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'weather': [
        {'main': condition.toString()},
      ],
      'main': {
        'temp': temp,
        'temp_min': minTemp,
        'temp_max': maxTemp,
      },
      'wind': {
        'speed': windSpeed,
      },
      'dt_txt': DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
    };
  }
}
