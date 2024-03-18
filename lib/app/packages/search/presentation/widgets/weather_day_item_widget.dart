import 'package:cloudwalk_challenge/app/commons/own_theme/core/theme/own_theme.dart';
import 'package:cloudwalk_challenge/app/packages/home/domain/model/city_weather.dart';
import 'package:cloudwalk_challenge/app/utils/formatter.dart';
import 'package:flutter/widgets.dart';

class WeatherDayItemWidget extends StatelessWidget {
  const WeatherDayItemWidget({required this.weather, required this.date, super.key});

  final DateTime date;
  final Weather weather;

  @override
  Widget build(BuildContext context) {
    final theme = OwnTheme.getDesignTokensOf(context);
    return Container(
      height: 100,
      width: 180,
      decoration: BoxDecoration(
        color: theme.colors.secondary,
        borderRadius: BorderRadius.circular(theme.borders.radius.large),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // icon of weather
          Center(
            child: Image.asset(
              'assets/icons/${weather.condition.icon.name}.png',
              fit: BoxFit.cover,
              width: 80,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                DayMonthFormatter().format(date),
                style: TextStyle(
                  fontSize: theme.font.size.xs,
                  fontFamily: theme.font.family.base,
                  fontWeight: theme.font.weight.regular,
                  color: theme.colors.white,
                ),
              ),
              SizedBox(height: theme.spacing.inline.xxxs),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    weather.temp.toStringAsFixed(0),
                    style: TextStyle(
                      fontSize: theme.font.size.xxs,
                      fontFamily: theme.font.family.base,
                      fontWeight: theme.font.weight.regular,
                      color: theme.colors.white,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 1.0, top: 2.0),
                    child: Text(
                      'ºC',
                      style: TextStyle(
                        fontSize: 10,
                        color: theme.colors.white.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
