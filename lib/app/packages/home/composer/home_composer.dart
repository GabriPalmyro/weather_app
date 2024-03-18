import 'package:cloudwalk_challenge/app/commons/local_database/local_database.dart';
import 'package:cloudwalk_challenge/app/packages/home/data/cache/home_cache.dart';
import 'package:cloudwalk_challenge/app/packages/home/data/repository/home_repository.dart';
import 'package:cloudwalk_challenge/app/packages/home/data/service/home_service.dart';
import 'package:cloudwalk_challenge/app/packages/home/data/service/locator_service.dart';
import 'package:cloudwalk_challenge/app/packages/home/domain/home_fallback.dart';
import 'package:cloudwalk_challenge/app/packages/home/domain/home_interactor.dart';
import 'package:cloudwalk_challenge/app/packages/home/presentation/bloc/home_cubit.dart';
import 'package:cloudwalk_challenge/app/packages/home/presentation/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class HomeComposer {
  HomeComposer._();

  static Widget compose() {
    final localDatabase = GetIt.I.get<LocalDatabase>();
    final service = GetIt.I.get<HomeService>();
    final cache = HomeCacheImpl(localDatabase: localDatabase);
    final repository = HomeRepositoryImpl(homeService: service, locatorService: GetIt.I<LocatorService>(), homeStore: cache);
    final fallback = HomeFallback(primaryLoader: repository, secondaryLoader: cache);
    final interactor = HomeInteractorImpl(loader: fallback);
    final cubit = HomeCubit(interactor);
    return HomePage(cubit: cubit);
  }
}
