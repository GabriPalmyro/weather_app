import 'package:cloudwalk_challenge/app/packages/home/domain/home_interactor.dart';
import 'package:cloudwalk_challenge/app/packages/home/domain/model/city_weather.dart';
import 'package:cloudwalk_challenge/app/packages/home/domain/model/weather_type.dart';
import 'package:cloudwalk_challenge/app/packages/home/presentation/bloc/home_cubit.dart';
import 'package:cloudwalk_challenge/app/packages/home/presentation/bloc/home_states.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeInteractor extends Mock implements HomeInteractor {}

void main() {
  group('HomeCubit | ', () {
    late HomeCubit homeCubit;
    late MockHomeInteractor mockHomeInteractor;

    setUp(() {
      mockHomeInteractor = MockHomeInteractor();
      homeCubit = HomeCubit(mockHomeInteractor);
    });

    testWidgets('''
      WHEN load is called
      THEN emit HomeLoading and HomeLoaded
      ''', (tester) async {
      // Arrange
      final currentWeather = CityWeather(
        cityName: 'São Paulo',
        weather: const [
          Weather(condition: WeatherCondition.clear, temp: 25, minTemp: 20, maxTemp: 30, windSpeed: 5),
        ],
        lastUpdated: DateTime.now(),
      );

      when(() => mockHomeInteractor.getCurrentWeather()).thenAnswer((_) async => currentWeather);

      // Act
      await homeCubit.load();

      // Assert
      expect(homeCubit.state, isA<HomeLoaded>());
      expect((homeCubit.state as HomeLoaded).cityWeather, currentWeather);
    });

    testWidgets('''
      WHEN load is called and an error occurs
      THEN emit HomeLoading and HomeError
      ''', (tester) async {
      // Arrange
      final error = Exception('An error occurred');
      when(() => mockHomeInteractor.getCurrentWeather()).thenThrow(error);

      // Act
      await homeCubit.load();

      // Assert
      expect(homeCubit.state, isA<HomeError>());
    });
  });
}
