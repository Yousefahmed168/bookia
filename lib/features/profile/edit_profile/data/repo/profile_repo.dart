

import 'dart:developer';

import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/profile/edit_profile/data/models/update_profile_params.dart';
import 'package:bookia/features/profile/edit_profile/data/models/update_profile_response/update_profile_response.dart';

class ProfileRepo {
  static Future<UpdateProfileResponse?> editProfile(
    UpdateProfileParams params,
  ) async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.updateProfile,
        data: params.toFormData(),
        headers: {
          'Content-Type': 'multipart/form-data',
          "authorization": "Bearer ${SharedPref.getToken()}",
        },
      );

      if (response.statusCode == 200) {
        var data = UpdateProfileResponse.fromJson(response.data);
        SharedPref.setUserInfo(data.data);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
  static Future<bool> logout() async {
    try {
      var response = await DioProvider.post(
        endpoint: Apis.logout,
        headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      );
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}