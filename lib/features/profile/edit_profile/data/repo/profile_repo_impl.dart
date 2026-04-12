import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/profile/edit_profile/data/data_sources/profile_remote_data_source.dart';
import 'package:bookia/features/profile/edit_profile/domain/repo/profile_repo.dart';
import 'package:dartz/dartz.dart';
import '../models/update_profile_params.dart';
import '../models/update_profile_response/update_profile_response.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDataSource remoteDataSource;

  ProfileRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, UpdateProfileResponse>> editProfile(UpdateProfileParams params) async {
    var response = await remoteDataSource.editProfile(await params.toFormData());
    return response.fold(
      (l) => Left(l),
      (r) {
        try {
          var data = UpdateProfileResponse.fromJson(r);
          SharedPref.setUserInfo(data.data);
          return Right(data);
        } catch (e) {
          return Left(ParseFailure(message: 'Error parsing profile data'));
        }
      },
    );
  }

  @override
  Future<Either<Failure, bool>> logout() async {
    await remoteDataSource.logout();
    return const Right(true);
  }
}
