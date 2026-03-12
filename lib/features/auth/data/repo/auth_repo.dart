import 'dart:developer';

import 'package:bookia/core/srevices/local/shared_pref.dart';

import '../../../../core/srevices/dio/apis.dart';
import '../../../../core/srevices/dio/dio_provider.dart';
import '../models/otpcode_respose.dart';
import '../models/register_params.dart';
import '../models/auth_response/register_response.dart';

class AuthRepo {
  static Future<AuthResponse?> register(RegisterParams params) async {
    try {
      log(params.toJson().toString());
      var response = await DioProvider.post(
        endpoint: Apis.register,
        data: params.toJson(),
      );
      if (response.statusCode == 201) {
        var data = AuthResponse.fromJson(response.data);
        await SharedPref.setToken(data.data?.token ?? '');
        await SharedPref.setUserInfo(data.data?.user);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> login(RegisterParams params) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.login,
        data: params.toJson(),
      );
      if (response.statusCode == 200) {
        var data = AuthResponse.fromJson(response.data);
        await SharedPref.setToken(data.data?.token ?? '');
        await SharedPref.setUserInfo(data.data?.user);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<AuthResponse?> forgetpassword(RegisterParams params) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.forgetpassword,
        data: params.toJson(),
      );
      if (response.statusCode == 200) {
        return AuthResponse.fromJson(response.data);
      } else if (response.statusCode == 500) {
        return null;
      }
      return null;
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<Otpcode?> otpcode(RegisterParams params) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.otpcode,
        data: params.toJson(),
      );

      if (response.statusCode == 200) {
        return Otpcode.fromJson(response.data);
      }

      if (response.statusCode == 500) {
        return null;
      }

      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<Otpcode?> resetpassword(RegisterParams params) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.otpcode,
        data: params.toJson(),
      );

      if (response.statusCode == 200) {
        return Otpcode.fromJson(response.data);
      }

      if (response.statusCode == 500) {
        return null;
      }

      return null;
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
