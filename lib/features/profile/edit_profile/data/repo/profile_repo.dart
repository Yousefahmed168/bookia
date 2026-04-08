import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/services/dio/apis.dart';
import '../../../../../core/services/dio/dio_provider.dart';
import '../../../../../core/services/local/shared_pref.dart';
import '../models/update_profile_params.dart';
import '../models/update_profile_response/update_profile_response.dart';

class ProfileRepo {
  static Future<Either<Failure, UpdateProfileResponse>> editProfile(
    UpdateProfileParams params,
  ) async {
    var response = await DioProvider.postApi(
      endpoint: Apis.updateProfile,
      data: await params.toFormData(),
      headers: {
        'Content-Type': 'multipart/form-data',
        "authorization": "Bearer ${SharedPref.getToken()}",
      },
    );

    return response.fold(
      (l) => Left(l),
      (right) {
        try {
          var data = UpdateProfileResponse.fromJson(right);
          SharedPref.setUserInfo(data.data);
          return Right(data);
        } catch (e) {
          return Left(ParseFailure(message: 'Error parsing profile data'));
        }
      },
    );
  }

  static Future<Either<Failure, bool>> logout() async {
    var response = await DioProvider.postApi(
      endpoint: Apis.logout,
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );

    return response.fold(
      (l) => Left(l),
      (right) => const Right(true),
    );
  }
}
