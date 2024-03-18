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
      width: MediaQuery.sizeOf(context).width * 0.95,
      decoration: BoxDecoration(
        color: theme.colors.secondary,
        borderRadius: BorderRadius.circular(theme.borders.radius.large),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DayOfWeekFormatter().format(date),
                style: TextStyle(
                  fontSize: theme.font.size.xxs,
                  fontFamily: theme.font.family.base,
                  fontWeight: theme.font.weight.bold,
                  color: theme.colors.white,
                ),
              ),
              Text(
                DayMonthFormatter().format(date),
                style: TextStyle(
                  fontSize: theme.font.size.xxxs,
                  fontFamily: theme.font.family.base,
                  fontWeight: theme.font.weight.regular,
                  color: theme.colors.white.withOpacity(0.85),
                ),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                weather.temp.toStringAsFixed(0),
                style: TextStyle(
                  fontSize: theme.font.size.xl,
                  fontFamily: theme.font.family.base,
                  fontWeight: theme.font.weight.bold,
                  color: theme.colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 1.0, top: 10.0),
                child: Text(
                  'ºC',
                  style: TextStyle(
                    fontSize: theme.font.size.sm,
                    fontFamily: theme.font.family.base,
                    fontWeight: theme.font.weight.semiBold,
                    color: theme.colors.white.withOpacity(0.5),
                  ),
                ),
              ),
            ],
          ),
          Center(
            child: Image.asset(
              'assets/icons/${weather.condition.icon.name}.png',
              fit: BoxFit.cover,
              height: 80,
            ),
          ),
        ],
      ),
    );
  }
}
