// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloudwalk_challenge/app/commons/local_database/local_database.dart'
    as _i6;
import 'package:cloudwalk_challenge/app/commons/network/network_provider.dart'
    as _i8;
import 'package:cloudwalk_challenge/app/commons/router/app_navigator.dart'
    as _i3;
import 'package:cloudwalk_challenge/app/commons/router/router_config.dart'
    as _i4;
import 'package:cloudwalk_challenge/app/packages/dash_tab/di/dash_tab_module.dart'
    as _i14;
import 'package:cloudwalk_challenge/app/packages/dash_tab/presentation/bloc/connection_status_cubit.dart'
    as _i5;
import 'package:cloudwalk_challenge/app/packages/home/data/service/home_service.dart'
    as _i10;
import 'package:cloudwalk_challenge/app/packages/home/data/service/locator_service.dart'
    as _i7;
import 'package:cloudwalk_challenge/app/packages/home/di/home_module.dart'
    as _i16;
import 'package:cloudwalk_challenge/app/packages/search/data/repository/search_repository.dart'
    as _i11;
import 'package:cloudwalk_challenge/app/packages/search/data/service/search_service.dart'
    as _i9;
import 'package:cloudwalk_challenge/app/packages/search/di/search_module.dart'
    as _i15;
import 'package:cloudwalk_challenge/app/packages/search/domain/search_interactor.dart'
    as _i12;
import 'package:cloudwalk_challenge/app/packages/search/presentation/bloc/search_cubit.dart'
    as _i13;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt $initAppGetIt({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appDashTabModule = _$AppDashTabModule();
    final appSearchModule = _$AppSearchModule();
    final appHomeModule = _$AppHomeModule();
    gh.lazySingleton<_i3.AppNavigator>(
        () => _i3.AppNavigatorImpl(gh<_i4.AppRouterConfig>()));
    gh.factory<_i5.ConnectionStatusCubit>(
        () => appDashTabModule.providesCubit());
    gh.lazySingleton<_i6.LocalDatabase>(() => _i6.SharedPreferencesDatabase());
    gh.factory<_i7.LocatorService>(() => _i7.LocatorServiceImpl());
    gh.factory<_i8.NetworkProvider>(() => _i8.NetworkProviderImlp());
    gh.factory<_i9.SearchService>(
        () => appSearchModule.providesService(gh<_i8.NetworkProvider>()));
    gh.factory<_i10.HomeService>(
        () => appHomeModule.providesService(gh<_i8.NetworkProvider>()));
    gh.factory<_i11.SearchRepository>(
        () => appSearchModule.providesRepository(gh<_i9.SearchService>()));
    gh.factory<_i12.SearchInteractor>(
        () => appSearchModule.providesInteractor(gh<_i11.SearchRepository>()));
    gh.factory<_i13.SearchCubit>(
        () => appSearchModule.providesCubit(gh<_i12.SearchInteractor>()));
    return this;
  }
}

class _$AppDashTabModule extends _i14.AppDashTabModule {}

class _$AppSearchModule extends _i15.AppSearchModule {}

class _$AppHomeModule extends _i16.AppHomeModule {}
