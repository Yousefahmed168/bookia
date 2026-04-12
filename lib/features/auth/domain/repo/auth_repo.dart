import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/auth/data/models/auth_response/auth_resopnse.dart';
import 'package:bookia/features/auth/data/models/otpcode_respose.dart';
import 'package:bookia/features/auth/data/models/register_params.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, AuthResponse>> login(AuthParams params);
  Future<Either<Failure, AuthResponse>> register(AuthParams params);
  Future<Either<Failure, AuthResponse>> forgetpassword(AuthParams params);
  Future<Either<Failure, Otpcode>> otpcode(AuthParams params);
  Future<Either<Failure, Otpcode>> resetpassword(AuthParams params);
}
