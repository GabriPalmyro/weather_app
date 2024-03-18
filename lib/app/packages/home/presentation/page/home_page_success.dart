import 'package:cloudwalk_challenge/app/commons/own_theme/core/theme/own_theme.dart';
import 'package:cloudwalk_challenge/app/packages/home/domain/model/city_weather.dart';
import 'package:cloudwalk_challenge/app/packages/home/presentation/widgets/next_days_weather_list.dart';
import 'package:cloudwalk_challenge/app/utils/formatter.dart';
import 'package:flutter/material.dart';

class HomePageSuccess extends StatelessWidget {
  const HomePageSuccess({required this.cityWeather, super.key});
  final CityWeather cityWeather;

  @override
  Widget build(BuildContext context) {
    final theme = OwnTheme.getDesignTokensOf(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: theme.spacing.inline.xl),
        Text(
          'Actual',
          style: TextStyle(
            fontSize: theme.font.size.xxxs,
            fontFamily: theme.font.family.base,
            fontWeight: theme.font.weight.light,
            color: theme.colors.white.withOpacity(0.8),
          ),
        ),
        Text(
          cityWeather.cityName,
          style: TextStyle(
            fontSize: theme.font.size.xl,
            fontFamily: theme.font.family.base,
            fontWeight: theme.font.weight.bold,
            color: theme.colors.white,
          ),
        ),
        SizedBox(height: theme.spacing.inline.xxxs),
        Text(
          DateFormatter().format(cityWeather.lastUpdated),
          style: TextStyle(
            fontSize: theme.font.size.xxs,
            fontFamily: theme.font.family.base,
            fontWeight: theme.font.weight.regular,
            color: theme.colors.white,
          ),
        ),
        SizedBox(height: theme.spacing.inline.sm),
        Container(
          height: 230,
          width: double.infinity,
          margin: EdgeInsets.symmetric(
            horizontal: theme.spacing.inline.md,
          ),
          child: Center(
            child: Image.asset(
              'assets/icons/${cityWeather.weather[0].condition.icon.name}.png',
              fit: BoxFit.cover,
              height: 200,
            ),
          ),
        ),
        SizedBox(height: theme.spacing.inline.sm),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: theme.spacing.inline.xl,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Temp',
                    style: TextStyle(
                      fontSize: theme.font.size.xxs,
                      fontFamily: theme.font.family.base,
                      fontWeight: theme.font.weight.regular,
                      color: theme.colors.white.withOpacity(0.7),
                    ),
                  ),
                  Text(
                    TemperatureFormatter().format(cityWeather.weather[0].temp),
                    style: TextStyle(
                      fontSize: theme.font.size.xs,
                      fontFamily: theme.font.family.base,
                      fontWeight: theme.font.weight.semiBold,
                      color: theme.colors.white,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Wind',
                    style: TextStyle(
                      fontSize: theme.font.size.xxs,
                      fontFamily: theme.font.family.base,
                      fontWeight: theme.font.weight.regular,
                      color: theme.colors.white.withOpacity(0.7),
                    ),
                  ),
                  Text(
                    WindFormatter().format(cityWeather.weather[0].windSpeed),
                    style: TextStyle(
                      fontSize: theme.font.size.xs,
                      fontFamily: theme.font.family.base,
                      fontWeight: theme.font.weight.semiBold,
                      color: theme.colors.white,
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Max',
                    style: TextStyle(
                      fontSize: theme.font.size.xxs,
                      fontFamily: theme.font.family.base,
                      fontWeight: theme.font.weight.regular,
                      color: theme.colors.white.withOpacity(0.7),
                    ),
                  ),
                  Text(
                    TemperatureFormatter().format(cityWeather.weather[0].maxTemp),
                    style: TextStyle(
                      fontSize: theme.font.size.xs,
                      fontFamily: theme.font.family.base,
                      fontWeight: theme.font.weight.semiBold,
                      color: theme.colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: theme.spacing.inline.sm),
        NextDayWeatherList(
          cityWeather: cityWeather.copyWith(
            weather: cityWeather.weather.sublist(1),
          ),
        ),
        SizedBox(height: theme.spacing.inline.lg),
      ],
    );
  }
}
