import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/profile/edit_profile/data/data_sources/profile_remote_data_source.dart';
import 'package:dartz/dartz.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  @override
  Future<Either<Failure, dynamic>> editProfile(dynamic data) async {
    return await DioProvider.postApi(
      endpoint: Apis.updateProfile,
      data: data,
      headers: {
        'Content-Type': 'multipart/form-data',
        "authorization": "Bearer ${SharedPref.getToken()}",
      },
    );
  }

  @override
  Future<void> logout() async {
    try {
      await DioProvider.post(
        endpoint: Apis.logout,
        headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      );
    } catch (e) {
      // Ignore API errors on logout
    }
  }
}
