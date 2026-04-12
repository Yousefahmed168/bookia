import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:bookia/features/auth/data/models/auth_response/auth_resopnse.dart';
import 'package:bookia/features/auth/data/models/otpcode_respose.dart';
import 'package:bookia/features/auth/data/models/register_params.dart';
import 'package:bookia/features/auth/domain/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, AuthResponse>> register(AuthParams params) async {
    var response = await remoteDataSource.register(params);

    return response.fold((l) => Left(l), (right) {
      var data = AuthResponse.fromJson(right);
      SharedPref.setToken(data.token ?? '');
      SharedPref.setUserInfo(data.user);
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, AuthResponse>> login(AuthParams params) async {
    var response = await remoteDataSource.login(params);

    return response.fold((l) => Left(l), (right) {
      var data = AuthResponse.fromJson(right);
      SharedPref.setToken(data.token ?? '');
      SharedPref.setUserInfo(data.user);
      return Right(data);
    });
  }

  @override
  Future<Either<Failure, AuthResponse>> forgetpassword(
    AuthParams params,
  ) async {
    var response = await remoteDataSource.forgetpassword(params);

    return response.fold(
      (l) => Left(l),
      (right) => Right(AuthResponse.fromJson(right)),
    );
  }

  @override
  Future<Either<Failure, Otpcode>> otpcode(AuthParams params) async {
    var response = await remoteDataSource.otpcode(params);

    return response.fold(
      (l) => Left(l),
      (right) => Right(Otpcode.fromJson(right)),
    );
  }

  @override
  Future<Either<Failure, Otpcode>> resetpassword(AuthParams params) async {
    var response = await remoteDataSource.resetpassword(params);

    return response.fold(
      (l) => Left(l),
      (right) => Right(Otpcode.fromJson(right)),
    );
  }
}
