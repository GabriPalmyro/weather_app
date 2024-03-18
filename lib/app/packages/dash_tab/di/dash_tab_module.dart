import 'package:cloudwalk_challenge/app/packages/dash_tab/presentation/bloc/connection_status_cubit.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppDashTabModule {
  ConnectionStatusCubit providesCubit() => ConnectionStatusCubit();
}
