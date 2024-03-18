import 'package:cloudwalk_challenge/app/packages/home/domain/home_interactor.dart';
import 'package:cloudwalk_challenge/app/packages/home/domain/model/city_weather.dart';
import 'package:cloudwalk_challenge/app/packages/home/domain/model/weather_type.dart';
import 'package:cloudwalk_challenge/app/packages/home/presentation/bloc/home_cubit.dart';
import 'package:cloudwalk_challenge/app/packages/home/presentation/bloc/home_states.dart';
import 'package:cloudwalk_challenge/app/packages/home/presentation/page/home_page.dart';
import 'package:cloudwalk_challenge/app/packages/home/presentation/page/home_page_error.dart';
import 'package:cloudwalk_challenge/app/packages/home/presentation/page/home_page_loading.dart';
import 'package:cloudwalk_challenge/app/packages/home/presentation/page/home_page_success.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeInteractor extends Mock implements HomeInteractor {}

void main() {
  group('HomePage', () {
    late HomeCubit cubit;
    late Widget homePage;
    late HomeInteractor homeInteractor;

    final cityWeather = CityWeather(
      cityName: 'São Paulo',
      weather: const [
        Weather(condition: WeatherCondition.clear, temp: 25, minTemp: 20, maxTemp: 30, windSpeed: 5),
      ],
      lastUpdated: DateTime.now(),
    );

    setUp(() {
      homeInteractor = MockHomeInteractor();
      cubit = HomeCubit(homeInteractor);
      homePage = HomePage(cubit: cubit);
      when(() => homeInteractor.getCurrentWeather()).thenAnswer((_) async => cityWeather);
    });

    testWidgets('should display loading state', (tester) async {
      await tester.pumpWidget(MaterialApp(home: homePage));

      expect(find.byType(HomePageLoading), findsOneWidget);
      expect(find.byType(HomePageSuccess), findsNothing);
      expect(find.byType(HomePageError), findsNothing);
    });

    testWidgets('should display success state', (tester) async {
      cubit.emit(HomeLoaded(cityWeather));

      await tester.pumpWidget(MaterialApp(home: homePage));

      expect(find.byType(HomePageLoading), findsNothing);
      expect(find.byType(HomePageSuccess), findsOneWidget);
      expect(find.byType(HomePageError), findsNothing);
    });

    testWidgets('should display error state', (tester) async {
      cubit.emit(const HomeError());

      await tester.pumpWidget(MaterialApp(home: homePage));

      expect(find.byType(HomePageLoading), findsNothing);
      expect(find.byType(HomePageSuccess), findsNothing);
      expect(find.byType(HomePageError), findsOneWidget);
    });

    testWidgets('should retry loading on error state', (tester) async {
      cubit.emit(const HomeError());

      await tester.pumpWidget(MaterialApp(home: homePage));

      await tester.tap(find.text('Tentar novamente'));
      await tester.pump();

      expect(find.byType(HomePageLoading), findsOneWidget);
      expect(find.byType(HomePageSuccess), findsNothing);
      expect(find.byType(HomePageError), findsNothing);
    });
  });
}
