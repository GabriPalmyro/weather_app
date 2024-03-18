import 'package:cloudwalk_challenge/app/commons/own_theme/core/theme/own_theme.dart';
import 'package:cloudwalk_challenge/app/packages/home/domain/model/city_weather.dart';
import 'package:cloudwalk_challenge/app/packages/home/presentation/widgets/weather_day_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

class NextDayWeatherList extends StatelessWidget {
  const NextDayWeatherList({required this.cityWeather, super.key});

  final CityWeather cityWeather;

  @override
  Widget build(BuildContext context) {
    final tokens = OwnTheme.getDesignTokensOf(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: tokens.spacing.inline.sm),
          child: Text(
            'Next forecast',
            style: TextStyle(
              fontSize: tokens.font.size.xs,
              fontFamily: tokens.font.family.base,
              fontWeight: tokens.font.weight.regular,
              color: tokens.colors.white,
            ),
          ),
        ),
        SizedBox(height: tokens.spacing.inline.xs),
        SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              cityWeather.weather.length,
              (index) {
                final day = cityWeather.weather[index];
                return Padding(
                  padding: EdgeInsets.symmetric(vertical: tokens.spacing.inline.xxs),
                  child: WeatherDayItemWidget(
                    weather: day,
                    date: cityWeather.lastUpdated.add(Duration(days: index + 1)),
                  ).animate().fadeIn(duration: 300.ms),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
