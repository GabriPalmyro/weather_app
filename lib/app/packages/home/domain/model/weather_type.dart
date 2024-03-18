

import 'package:cloudwalk_challenge/app/commons/own_theme/core/tokens/support/icons/icons.dart';

enum WeatherCondition {
  clear,
  cloudy,
  rain,
  snow,
  unknown;

  static WeatherCondition fromString(String value) {
    switch (value.toLowerCase()) {
      case 'clear':
        return WeatherCondition.clear;
      case 'clouds':
        return WeatherCondition.cloudy;
      case 'rain':
        return WeatherCondition.rain;
      case 'snow':
        return WeatherCondition.snow;
      default:
        return WeatherCondition.unknown;
    }
  }

  AppIconData get icon {
    switch (this) {
      case WeatherCondition.clear:
        return AppIcons.sunny;
      case WeatherCondition.cloudy:
        return AppIcons.cloudy;
      case WeatherCondition.rain:
        return AppIcons.rainy;
      case WeatherCondition.snow:
        return AppIcons.snow;
      default:
        return AppIcons.sunny;
    }
  }
}
