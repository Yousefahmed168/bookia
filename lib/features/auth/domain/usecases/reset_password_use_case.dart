import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/auth/data/models/otpcode_respose.dart';
import 'package:bookia/features/auth/data/models/register_params.dart';
import 'package:bookia/features/auth/domain/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';

class ResetPasswordUseCase {
  final AuthRepo repository;

  ResetPasswordUseCase(this.repository);

  Future<Either<Failure, Otpcode>> call(AuthParams params) {
    return repository.resetpassword(params);
  }
}
