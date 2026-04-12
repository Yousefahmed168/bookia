import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/place_order/data/data_sources/place_order_remote_data_source.dart';
import 'package:bookia/features/place_order/domain/repo/place_order_repo.dart';
import 'package:dartz/dartz.dart';
import '../models/governorate.dart';

class PlaceOrderRepoImpl implements PlaceOrderRepo {
  final PlaceOrderRemoteDataSource remoteDataSource;

  PlaceOrderRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Governorate>>> getGovernorates() async {
    var response = await remoteDataSource.getGovernorates();
    return response.fold(
      (l) => Left(l),
      (right) {
        try {
          var list = right as List<dynamic>;
          var governoratesList = list
              .map((e) => Governorate.fromJson(e as Map<String, dynamic>))
              .toList();
          return Right(governoratesList);
        } catch (e) {
          return Left(ParseFailure(message: 'Error parsing governorates data'));
        }
      },
    );
  }

  @override
  Future<Either<Failure, bool>> placeOrder({
    required String name,
    required String email,
    required String phone,
    required String address,
    required int governorateId,
  }) async {
    var response = await remoteDataSource.placeOrder({
      'name': name,
      'email': email,
      'phone': phone,
      'address': address,
      'governorate_id': governorateId,
    });

    return response.fold(
      (l) => Left(l),
      (right) => const Right(true),
    );
  }
}
