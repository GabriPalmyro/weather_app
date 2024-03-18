import 'package:cloudwalk_challenge/app/commons/own_theme/core/theme/own_theme.dart';
import 'package:cloudwalk_challenge/app/packages/home/domain/model/city_weather.dart';
import 'package:cloudwalk_challenge/app/packages/home/presentation/widgets/weather_day_item_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';

class NextDayWeatherList extends StatelessWidget {
  const NextDayWeatherList({required this.cityWeather, super.key});

  final CityWeather cityWeather;

  @override
  Widget build(BuildContext context) {
    final tokens = OwnTheme.getDesignTokensOf(context);
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: tokens.spacing.inline.sm),
          child: Text(
            'Next Days',
            style: TextStyle(
              fontSize: tokens.font.size.xs,
              fontWeight: tokens.font.weight.regular,
              color: tokens.colors.white,
            ),
          ),
        ),
        SizedBox(height: tokens.spacing.inline.xs),
        SizedBox(
          height: 100,
          child: ListView.builder(
            itemCount: cityWeather.weather.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: tokens.spacing.inline.xxs).copyWith(
                  left: index == 0 ? tokens.spacing.inline.sm : tokens.spacing.inline.xxs,
                ),
                child: WeatherDayItemWidget(
                  weather: cityWeather.weather[index],
                  date: cityWeather.lastUpdated.add(Duration(days: index + 1)),
                )
                    .animate()
                    .fadeIn(duration: 300.ms),
              );
            },
          ),
        ),
      ],
    );
  }
}
