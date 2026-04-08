
import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/services/dio/apis.dart';
import '../../../../core/services/dio/dio_provider.dart';
import '../../../../core/services/local/shared_pref.dart';
import '../models/auth_response/auth_resopnse.dart';
import '../models/otpcode_respose.dart';
import '../models/register_params.dart';

class AuthRepo {
  static Future<Either<Failure, AuthResponse>> register(
    RegisterParams params,
  ) async {
    var response = await DioProvider.postApi(
      endpoint: Apis.register,
      data: params.toJson(),
    );

    return response.fold(
      (l) => Left(l),
      (right) {
        var data = AuthResponse.fromJson(right);
        SharedPref.setToken(data.token ?? '');
        SharedPref.setUserInfo(data.user);
        return Right(data);
      },
    );
  }

  static Future<Either<Failure, AuthResponse>> login(
    RegisterParams params,
  ) async {
    var response = await DioProvider.postApi(
      endpoint: Apis.login,
      data: params.toJson(),
    );

    return response.fold(
      (l) {
        return Left(l);
      },
      (right) {
        var data = AuthResponse.fromJson(right);
        SharedPref.setToken(data.token ?? '');
        SharedPref.setUserInfo(data.user);
        return Right(data);
      },
    );
  }

  static Future<Either<Failure, AuthResponse>> forgetpassword(
    RegisterParams params,
  ) async {
    var response = await DioProvider.postApi(
      endpoint: Apis.forgetpassword,
      data: params.toJson(),
    );

    return response.fold(
      (l) => Left(l),
      (right) => Right(AuthResponse.fromJson(right)),
    );
  }

  static Future<Either<Failure, Otpcode>> otpcode(
    RegisterParams params,
  ) async {
    var response = await DioProvider.postApi(
      endpoint: Apis.otpcode,
      data: params.toJson(),
    );

    return response.fold(
      (l) => Left(l),
      (right) => Right(Otpcode.fromJson(right)),
    );
  }

  static Future<Either<Failure, Otpcode>> resetpassword(
    RegisterParams params,
  ) async {
    var response = await DioProvider.postApi(
      endpoint: Apis.otpcode,
      data: params.toJson(),
    );

    return response.fold(
      (l) => Left(l),
      (right) => Right(Otpcode.fromJson(right)),
    );
  }
}
