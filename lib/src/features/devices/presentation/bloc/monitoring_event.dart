part of 'monitoring_bloc.dart';

sealed class MonitoringEvent extends Equatable {
  const MonitoringEvent();

  @override
  List<Object> get props => [];
}

class MonitoringEventFirst extends MonitoringEvent {}

class MonitoringEventPeriodic extends MonitoringEvent {}
