import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/auth/data/models/auth_response/auth_resopnse.dart';
import 'package:bookia/features/auth/data/models/register_params.dart';
import 'package:bookia/features/auth/domain/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';

class ForgetPasswordUseCase {
  final AuthRepo repository;

  ForgetPasswordUseCase(this.repository);

  Future<Either<Failure, AuthResponse>> call(AuthParams params) {
    return repository.forgetpassword(params);
  }
}
