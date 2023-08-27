import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sipunggur_app/src/features/devices/data/node_service.dart';
import 'package:sipunggur_app/src/features/devices/domain/monitoring_model.dart'
    as monitoring;

part 'monitoring_event.dart';
part 'monitoring_state.dart';

class MonitoringBloc extends Bloc<MonitoringEvent, MonitoringState> {
  MonitoringBloc() : super(MonitoringInitial()) {
    on<MonitoringEventFirst>(_getMonitoringFirst);
    on<MonitoringEventPeriodic>(_getMonitoringContinue);
  }

  final NodeService _nodeService = NodeService();

  FutureOr<void> _getMonitoringFirst(
    monitoringEvent,
    Emitter<MonitoringState> emit,
  ) async {
    try {
      emit(MonitoringLoading());

      monitoring.MonitoringModel monitoringModel =
          await _nodeService.getMonitoring();

      return emit(MonitoringSuccess(monitoringModel));
    } catch (e) {
      return emit(
        MonitoringFailed(
            'Please check your internet connection again, use a stable connection'),
      );
    }
  }

  FutureOr<void> _getMonitoringContinue(
    monitoringEvent,
    Emitter<MonitoringState> emit,
  ) async {
    try {
      monitoring.MonitoringModel monitoringModel =
          await _nodeService.getMonitoring();
      return emit(MonitoringSuccess(monitoringModel));
    } catch (e) {
      return emit(
        MonitoringFailed(
            'Please check your internet connection again, use a stable connection'),
      );
    }
  }
}
