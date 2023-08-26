import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sipunggur_app/src/features/devices/domain/control_model.dart'
    as control;
import 'package:sipunggur_app/src/features/devices/domain/monitoring_model.dart'
    as monitoring;

import '../../auth/domain/main_url.dart';

class NodeService {
  final MainUrl _mainUrl = MainUrl();
  Dio dio = Dio();
  final storage = const FlutterSecureStorage();

  Future<control.ControlModel> getControl() async {
    try {
      String? value = await storage.read(key: 'save');
      _mainUrl.setToken(value);
      if (_mainUrl.getToken().isEmpty) {
        throw Exception('Token kosong');
      }

      final response = await dio.get(
        "${_mainUrl.mainUrl}api/control",
        options: Options(
          headers: {'Authorization': "Bearer ${value}"},
        ),
      );
      if (response.statusCode == 200) {
        control.ControlModel result =
            control.ControlModel.fromJson(response.data);
        return result;
      } else {
        throw Exception(
            'Get tidak berhasil dengan code ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<monitoring.MonitoringModel> getMonitoring() async {
    try {
      String? value = await storage.read(key: 'save');
      _mainUrl.setToken(value);
      if (_mainUrl.getToken().isEmpty) {
        throw Exception('Token kosong');
      }

      final response = await dio.get(
        "${_mainUrl.mainUrl}api/node",
        options: Options(
          headers: {'Authorization': "Bearer ${value}"},
        ),
      );
      if (response.statusCode == 200) {
        monitoring.MonitoringModel result =
            monitoring.MonitoringModel.fromJson(response.data);
        return result;
      } else {
        throw Exception(
            'Get tidak berhasil dengan code ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
