import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'time_event.dart';

class TimeBloc extends Bloc<TimeEvent, String> {
  TimeBloc() : super('...') {
    on<ChangeTime>((event, emit) {
      event.timing = 'Good Morning';
      DateTime now = DateTime.now();
      if (now.hour < 12) {
        event.timing = 'Good Morning';
      } else if (now.hour < 18) {
        event.timing = 'Good E';
      }
      emit(event.timing);
    });
  }
}
