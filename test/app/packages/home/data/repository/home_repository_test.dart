import 'package:cloudwalk_challenge/app/packages/home/data/repository/home_repository.dart';
import 'package:cloudwalk_challenge/app/packages/home/data/service/home_service.dart';
import 'package:cloudwalk_challenge/app/packages/home/data/service/locator_service.dart';
import 'package:cloudwalk_challenge/app/packages/home/domain/interfaces/home_store.dart';
import 'package:cloudwalk_challenge/app/packages/home/domain/model/city_weather.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockHomeService extends Mock implements HomeService {}

class MockLocatorService extends Mock implements LocatorService {}

class MockHomeStore extends Mock implements HomeStore {}

void main() {
  group('HomeRepositoryImpl', () {
    late HomeRepositoryImpl homeRepository;
    late HomeService homeService;
    late LocatorService locatorService;
    late HomeStore homeStore;

    setUp(() {
      homeService = MockHomeService();
      locatorService = MockLocatorService();
      homeStore = MockHomeStore();
      homeRepository = HomeRepositoryImpl(
        homeService: homeService,
        locatorService: locatorService,
        homeStore: homeStore,
      );

      when(() => locatorService.getCurrentLocation()).thenAnswer((_) async => {'lat': '0.0', 'lon': '0.0'});
      when(() => homeService.load(lat: '0.0', lon: '0.0')).thenAnswer((_) async => CityWeather(cityName: 'Test City', weather: [], lastUpdated: DateTime.now()));
    });

    test('''
      WHEN load is called
      THEN return city weather
      ''', () async {
      final cityWeather = await homeRepository.load();

      expect(cityWeather, isA<CityWeather>());
      expect(cityWeather.cityName, 'Test City');
    });

    test('''
      WHEN load is called
      THEN save city weather
      ''', () async {
      final cityWeather = await homeRepository.load();
      verify(() => homeStore.save(cityWeather)).called(1);
    });
  });
}
