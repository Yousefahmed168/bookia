import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';
import '../../data/models/update_profile_params.dart';
import '../../data/models/update_profile_response/update_profile_response.dart';

abstract class ProfileRepo {
  Future<Either<Failure, UpdateProfileResponse>> editProfile(UpdateProfileParams params);
  Future<Either<Failure, bool>> logout();
}
