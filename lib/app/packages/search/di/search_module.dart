import 'package:cloudwalk_challenge/app/commons/network/network_provider.dart';
import 'package:cloudwalk_challenge/app/packages/search/data/repository/search_repository.dart';
import 'package:cloudwalk_challenge/app/packages/search/data/service/search_service.dart';
import 'package:cloudwalk_challenge/app/packages/search/domain/search_interactor.dart';
import 'package:cloudwalk_challenge/app/packages/search/presentation/bloc/search_cubit.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppSearchModule {
  SearchService providesService(
    NetworkProvider networkProvider,
  ) =>
      SearchServiceImpl(
        networkProvider: networkProvider,
      );

  SearchRepository providesRepository(
    SearchService searchService,
  ) =>
      SearchRepositoryImpl(
        searchService: searchService,
      );

  SearchInteractor providesInteractor(
    SearchRepository searchRepository,
  ) =>
      SearchInteractorImpl(
        searchRepository,
      );

  SearchCubit providesCubit(
    SearchInteractor searchInteractor,
  ) =>
      SearchCubit(
        searchInteractor,
      );
}
