import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:sipunggur_app/src/features/auth/domain/main_url.dart';
import 'package:sipunggur_app/src/features/log/domain/log_model.dart' as log;

class LogService {
  final MainUrl _mainUrl = MainUrl();
  Dio dio = Dio();
  final storage = const FlutterSecureStorage();

  Future<log.LogModel> getLogData() async {
    try {
      String? value = await storage.read(key: 'save');
      _mainUrl.setToken(value);
      if (_mainUrl.getToken().isEmpty) {
        throw Exception('Token kosong');
      }

      final response = await dio.get(
        "${_mainUrl.mainUrl}api/log",
        options: Options(
          headers: {'Authorization': "Bearer ${value}"},
        ),
      );
      if (response.statusCode == 200) {
        log.LogModel result = log.LogModel.fromJson(response.data);
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
