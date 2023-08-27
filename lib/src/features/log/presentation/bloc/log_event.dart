part of 'log_bloc.dart';

sealed class LogEvent extends Equatable {
  const LogEvent();

  @override
  List<Object> get props => [];
}

class LogEventData extends LogEvent {}
