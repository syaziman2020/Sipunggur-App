import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:sipunggur_app/src/features/devices/data/node_service.dart';
import 'package:sipunggur_app/src/features/devices/domain/control_model.dart'
    as control;
import 'package:sipunggur_app/src/features/devices/domain/monitoring_model.dart'
    as monitoring;

part 'device_event.dart';
part 'device_state.dart';

class DeviceBloc extends Bloc<DeviceEvent, DeviceState> {
  DeviceBloc() : super(DeviceInitial()) {
    on<ControlEvent>(_getControlFirst);
    on<ControlEventPeriodic>(_getControlContinue);
    on<ControlEventPeriodic>(_getMonitoringFirst);
    on<ControlEventPeriodic>(_getMonitoringContinue);
  }

  final NodeService _nodeService = NodeService();

  FutureOr<void> _getControlFirst(
    controlEvent,
    Emitter<DeviceState> emit,
  ) async {
    try {
      emit(ControlLoading());

      control.ControlModel controlModel = await _nodeService.getControl();

      return emit(ControlSuccess(controlModel));
    } catch (e) {
      return emit(
        ControlFailed(
            'Please check your internet connection again, use a stable connection'),
      );
    }
  }

  FutureOr<void> _getControlContinue(
    controlEvent,
    Emitter<DeviceState> emit,
  ) async {
    try {
      control.ControlModel controlModel = await _nodeService.getControl();
      return emit(ControlSuccess(controlModel));
    } catch (e) {
      return emit(
        ControlFailed(
            'Please check your internet connection again, use a stable connection'),
      );
    }
  }

  FutureOr<void> _getMonitoringFirst(
    monitoringEvent,
    Emitter<DeviceState> emit,
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
    Emitter<DeviceState> emit,
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
