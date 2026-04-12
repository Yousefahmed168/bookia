import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';
import '../../data/models/reset_password_params.dart';
import '../../data/models/reset_password_response/reset_password_response.dart';

abstract class ResetProfilePasswordRepo {
  Future<Either<Failure, ResetPasswordResponse>> updatePassword(ResetPasswordParams params);
}
