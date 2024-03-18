import 'dart:developer' as dev;

import 'package:cloudwalk_challenge/app/packages/search/domain/search_interactor.dart';
import 'package:cloudwalk_challenge/app/packages/search/presentation/bloc/search_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._searchInteractor) : super(const SearchInitial());

  final SearchInteractor _searchInteractor;

  Future<void> load() async {
    emit(const SearchLoading());
    try {
      final cities = await _searchInteractor.getCitiesWeathers();
      emit(SearchLoaded(cities));
    } catch (e) {
      dev.log(e.toString(), name: 'SearchCubit');
      emit(const SearchError());
    }
  }
}