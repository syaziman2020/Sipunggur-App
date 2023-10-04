part of 'time_bloc.dart';

sealed class TimeEvent extends Equatable {
  const TimeEvent();

  @override
  List<Object> get props => [];
}

class ChangeTime extends TimeEvent {
  String timing;
  ChangeTime(this.timing);

  @override
  List<Object> get props => [timing];
}
