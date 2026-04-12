import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:bookia/features/auth/data/models/auth_response/auth_resopnse.dart';
import 'package:bookia/features/auth/data/models/otpcode_respose.dart';
import 'package:bookia/features/auth/data/models/register_params.dart';
import 'package:dartz/dartz.dart';

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  @override
  Future<Either<Failure, dynamic>> register(AuthParams params) async {
    return await DioProvider.postApi(
      endpoint: Apis.register,
      data: params.toJson(),
    );
  }

  @override
  Future<Either<Failure, dynamic>> login(AuthParams params) async {
    return await DioProvider.postApi(
      endpoint: Apis.login,
      data: params.toJson(),
    );
  }

  @override
  Future<Either<Failure, dynamic>> forgetpassword(AuthParams params) async {
    return await DioProvider.postApi(
      endpoint: Apis.forgetpassword,
      data: params.toJson(),
    );
  }

  @override
  Future<Either<Failure, dynamic>> otpcode(AuthParams params) async {
    return await DioProvider.postApi(
      endpoint: Apis.otpcode,
      data: params.toJson(),
    );
  }

  @override
  Future<Either<Failure, dynamic>> resetpassword(AuthParams params) async {
    return await DioProvider.postApi(
      endpoint: Apis
          .otpcode, // NOTE: Check if it's really the same endpoint! In the old logic it was Apis.otpcode as well...
      data: params.toJson(),
    );
  }
}

Future<Either<Failure, AuthResponse>> forgetpassword(AuthParams params) async {
  var response = await DioProvider.postApi(
    endpoint: Apis.forgetpassword,
    data: params.toJson(),
  );

  return response.fold(
    (l) => Left(l),
    (right) => Right(AuthResponse.fromJson(right)),
  );
}

Future<Either<Failure, Otpcode>> otpcode(AuthParams params) async {
  var response = await DioProvider.postApi(
    endpoint: Apis.otpcode,
    data: params.toJson(),
  );

  return response.fold(
    (l) => Left(l),
    (right) => Right(Otpcode.fromJson(right)),
  );
}

Future<Either<Failure, Otpcode>> resetpassword(AuthParams params) async {
  var response = await DioProvider.postApi(
    endpoint: Apis.otpcode,
    data: params.toJson(),
  );

  return response.fold(
    (l) => Left(l),
    (right) => Right(Otpcode.fromJson(right)),
  );
}
