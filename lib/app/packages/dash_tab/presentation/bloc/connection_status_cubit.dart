import 'dart:async';
import 'dart:developer';

import 'package:cloudwalk_challenge/app/packages/dash_tab/presentation/bloc/connection_status_state.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectionStatusCubit extends Cubit<ConnectionStatusState> {
  ConnectionStatusCubit() : super(ConnectionStatusInitial());

  late final StreamSubscription<ConnectivityResult> subscription;

  void init() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      log('Connectivity changed: $result');
      if (result == ConnectivityResult.none) {
        emit(ConnectionStatusDisconnected());
      } else {
        emit(ConnectionStatusConnected());
      }
    });
  }

  @override
  Future<void> close() {
    subscription.cancel();
    return super.close();
  }
}
