import 'dart:developer' as dev;

import 'package:cloudwalk_challenge/app/packages/home/domain/home_interactor.dart';
import 'package:cloudwalk_challenge/app/packages/home/presentation/bloc/home_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this._homeInteractor) : super(const HomeInitial());

  final HomeInteractor _homeInteractor;

  Future<void> load() async {
    emit(const HomeLoading());
    try {
      final currentWeather = await _homeInteractor.getCurrentWeather();
      emit(HomeLoaded(currentWeather));
    } catch (e) {
      dev.log(e.toString(), name: 'HomeCubit');
      emit(const HomeError());
    }
  }
}