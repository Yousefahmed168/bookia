import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/profile/reset_password/domain/repo/reset_password_repo.dart';
import 'package:dartz/dartz.dart';
import '../../data/models/reset_password_params.dart';
import '../../data/models/reset_password_response/reset_password_response.dart';

class ResetProfilePasswordUseCase {
  final ResetProfilePasswordRepo repository;

  ResetProfilePasswordUseCase(this.repository);

  Future<Either<Failure, ResetPasswordResponse>> call(ResetPasswordParams params) async {
    return await repository.updatePassword(params);
  }
}
