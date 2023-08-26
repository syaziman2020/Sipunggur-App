import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'dart:developer';

import 'package:sipunggur_app/src/features/auth/domain/main_url.dart';
import 'package:sipunggur_app/src/features/auth/domain/profile_model.dart'
    as profile;
import 'package:sipunggur_app/src/features/auth/domain/user_model.dart' as user;

class AuthService {
  final MainUrl _mainUrl = MainUrl();
  Dio dio = Dio();
  final storage = const FlutterSecureStorage();

  Future<user.UserModel>? loginProfile(
      {required String email, required String password}) async {
    try {
      final response = await dio.post("${_mainUrl.mainUrl}api/login",
          data: jsonEncode({
            'email': email,
            'password': password,
          }));

      log(response.statusCode.toString());
      if (response.statusCode == 200) {
        user.UserModel result = user.UserModel.fromJson(response.data);
        if (result.meta?.status == 'success') {
          _mainUrl.setToken(result.data!.accessToken.toString());
          await storage.write(key: 'save', value: _mainUrl.getToken());

          print(response.data);

          return result;
        }
        log(result.data!.accessToken.toString());
      }
      if (_mainUrl.getToken().isEmpty) {
        throw Exception('token kosong');
      } else {
        throw Exception(
            'Post tidak berhasil dengan code ${response.statusCode}');
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<bool>? logout() async {
    try {
      String? value = await storage.read(key: 'save');
      final response = await dio.get(
        "${_mainUrl.mainUrl}/logout",
        options: Options(
          headers: {'Authorization': "Bearer ${value}"},
        ),
      );

      if (response.statusCode == 200) {
        await storage.delete(key: 'save');
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<profile.ProfileModel> getProfile() async {
    try {
      String? value = await storage.read(key: 'save');
      _mainUrl.setToken(value);
      if (_mainUrl.getToken().isEmpty) {
        throw Exception('Token kosong');
      }

      final response = await dio.get(
        "${_mainUrl.mainUrl}api/user",
        options: Options(
          headers: {'Authorization': "Bearer ${value}"},
        ),
      );
      if (response.statusCode == 200) {
        profile.ProfileModel result =
            profile.ProfileModel.fromJson(response.data);

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
