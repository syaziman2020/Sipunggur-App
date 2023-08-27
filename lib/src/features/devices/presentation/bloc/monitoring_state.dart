part of 'monitoring_bloc.dart';

sealed class MonitoringState extends Equatable {
  const MonitoringState();

  @override
  List<Object> get props => [];
}

final class MonitoringInitial extends MonitoringState {}

final class MonitoringLoading extends MonitoringState {}

final class MonitoringFailed extends MonitoringState {
  final String message;
  MonitoringFailed(this.message);

  @override
  List<Object> get props => [message];
}

final class MonitoringSuccess extends MonitoringState {
  monitoring.MonitoringModel monitoringModel;
  MonitoringSuccess(this.monitoringModel);

  @override
  List<Object> get props => [monitoringModel];
}
