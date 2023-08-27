part of 'log_bloc.dart';

sealed class LogState extends Equatable {
  const LogState();

  @override
  List<Object> get props => [];
}

final class LogInitial extends LogState {}

final class LogLoading extends LogState {}

final class LogSuccess extends LogState {
  final log.LogModel logModel;
  LogSuccess(this.logModel);

  @override
  List<Object> get props => [logModel];
}

final class LogFailed extends LogState {
  final String message;
  LogFailed(this.message);

  @override
  List<Object> get props => [message];
}
