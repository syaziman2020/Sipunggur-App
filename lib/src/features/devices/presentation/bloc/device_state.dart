part of 'device_bloc.dart';

sealed class DeviceState extends Equatable {
  const DeviceState();

  @override
  List<Object> get props => [];
}

final class DeviceInitial extends DeviceState {}

final class ControlLoading extends DeviceState {}

final class ControlFailed extends DeviceState {
  final String message;
  ControlFailed(this.message);

  @override
  List<Object> get props => [message];
}

final class ControlSuccess extends DeviceState {
  control.ControlModel controlModel;
  ControlSuccess(this.controlModel);

  @override
  List<Object> get props => [controlModel];
}

final class MonitoringLoading extends DeviceState {}

final class MonitoringFailed extends DeviceState {
  final String message;
  MonitoringFailed(this.message);

  @override
  List<Object> get props => [message];
}

final class MonitoringSuccess extends DeviceState {
  monitoring.MonitoringModel monitoringModel;
  MonitoringSuccess(this.monitoringModel);

  @override
  List<Object> get props => [monitoringModel];
}
