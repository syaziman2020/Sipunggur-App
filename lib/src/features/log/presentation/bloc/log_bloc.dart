import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sipunggur_app/src/features/log/data/log_service.dart';
import 'package:sipunggur_app/src/features/log/domain/log_model.dart' as log;

part 'log_event.dart';
part 'log_state.dart';

class LogBloc extends Bloc<LogEvent, LogState> {
  LogBloc() : super(LogInitial()) {
    on<LogEventData>(_getLogData);
  }

  LogService _logService = LogService();

  FutureOr<void> _getLogData(
    logEvent,
    Emitter<LogState> emit,
  ) async {
    try {
      emit(LogLoading());
      log.LogModel logModel = await _logService.getLogData();
      return emit(LogSuccess(logModel));
    } catch (e) {
      return emit(
        LogFailed(
            'Please check your internet connection again, use a stable connection'),
      );
    }
  }
}
