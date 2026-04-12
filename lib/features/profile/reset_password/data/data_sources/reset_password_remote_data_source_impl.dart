import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/profile/reset_password/data/data_sources/reset_password_remote_data_source.dart';
import 'package:dartz/dartz.dart';

class ResetPasswordRemoteDataSourceImpl implements ResetPasswordRemoteDataSource {
  @override
  Future<Either<Failure, dynamic>> updatePassword(Map<String, dynamic> data) async {
    return await DioProvider.postApi(
      endpoint: Apis.updatePassword,
      data: data,
      headers: {'Authorization': 'Bearer ${SharedPref.getToken()}'},
    );
  }
}
