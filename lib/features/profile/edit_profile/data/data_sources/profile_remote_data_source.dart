import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRemoteDataSource {
  Future<Either<Failure, dynamic>> editProfile(dynamic data);
  Future<void> logout();
}
