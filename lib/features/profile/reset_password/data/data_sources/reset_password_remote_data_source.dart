import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ResetPasswordRemoteDataSource {
  Future<Either<Failure, dynamic>> updatePassword(Map<String, dynamic> data);
}
