import 'package:equatable/equatable.dart';

abstract class ConnectionStatusState extends Equatable {
  const ConnectionStatusState();

  @override
  List<Object> get props => [];
}

class ConnectionStatusInitial extends ConnectionStatusState {}

class ConnectionStatusConnected extends ConnectionStatusState {}

class ConnectionStatusDisconnected extends ConnectionStatusState {}

class ConnectionStatusError extends ConnectionStatusState {}
