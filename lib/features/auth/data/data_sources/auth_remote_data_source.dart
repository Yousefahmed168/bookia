import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/auth/data/models/register_params.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRemoteDataSource {
  Future<Either<Failure, dynamic>> register(AuthParams params);
  Future<Either<Failure, dynamic>> login(AuthParams params);
  Future<Either<Failure, dynamic>> forgetpassword(AuthParams params);
  Future<Either<Failure, dynamic>> otpcode(AuthParams params);
  Future<Either<Failure, dynamic>> resetpassword(AuthParams params);
}

