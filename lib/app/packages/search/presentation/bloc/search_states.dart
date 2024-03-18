import 'package:cloudwalk_challenge/app/packages/home/domain/model/city_weather.dart';
import 'package:equatable/equatable.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {
  const SearchInitial();
}

class SearchLoading extends SearchState {
  const SearchLoading();
}

class SearchLoaded extends SearchState {
  const SearchLoaded(this.cities);
  final List<CityWeather> cities;

  @override
  List<Object> get props => [cities];
}

class SearchError extends SearchState {
  const SearchError();
}
