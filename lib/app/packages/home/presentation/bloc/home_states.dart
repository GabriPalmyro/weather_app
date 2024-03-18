import 'package:cloudwalk_challenge/app/packages/home/domain/model/city_weather.dart';
import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeLoaded extends HomeState {
  const HomeLoaded(this.cityWeather);
  final CityWeather cityWeather;

  @override
  List<Object> get props => [cityWeather];
}

class HomeError extends HomeState {
  const HomeError();
}
