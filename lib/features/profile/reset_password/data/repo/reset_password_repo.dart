import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/services/dio/apis.dart';
import '../../../../../core/services/dio/dio_provider.dart';
import '../../../../../core/services/local/shared_pref.dart';
import '../models/reset_password_params.dart';
import '../models/reset_password_response/reset_password_response.dart';

abstract class ResetPasswordRepo {
  static Future<Either<Failure, ResetPasswordResponse>> updatePassword(
    ResetPasswordParams params,
  ) async {
    final token = SharedPref.getToken();

    var response = await DioProvider.postApi(
      endpoint: Apis.updatePassword,
      data: params.toJson(),
      headers: {'Authorization': 'Bearer $token'},
    );

    return response.fold(
      (l) => Left(l),
      (right) => Right(ResetPasswordResponse.fromJson(right)),
    );
  }
}
