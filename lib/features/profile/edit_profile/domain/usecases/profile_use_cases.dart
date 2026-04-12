import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/profile/edit_profile/domain/repo/profile_repo.dart';
import 'package:dartz/dartz.dart';
import '../../data/models/update_profile_params.dart';
import '../../data/models/update_profile_response/update_profile_response.dart';

class EditProfileUseCase {
  final ProfileRepo repository;

  EditProfileUseCase(this.repository);

  Future<Either<Failure, UpdateProfileResponse>> call(UpdateProfileParams params) async {
    return await repository.editProfile(params);
  }
}

class LogoutUseCase {
  final ProfileRepo repository;

  LogoutUseCase(this.repository);

  Future<Either<Failure, bool>> call() async {
    return await repository.logout();
  }
}
