import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/profile/reset_password/data/data_sources/reset_password_remote_data_source.dart';
import 'package:bookia/features/profile/reset_password/domain/repo/reset_password_repo.dart';
import 'package:dartz/dartz.dart';
import '../models/reset_password_params.dart';
import '../models/reset_password_response/reset_password_response.dart';

class ResetProfilePasswordRepoImpl implements ResetProfilePasswordRepo {
  final ResetPasswordRemoteDataSource remoteDataSource;

  ResetProfilePasswordRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, ResetPasswordResponse>> updatePassword(ResetPasswordParams params) async {
    var response = await remoteDataSource.updatePassword(params.toJson());
    return response.fold(
      (l) => Left(l),
      (r) => Right(ResetPasswordResponse.fromJson(r)),
    );
  }
}
