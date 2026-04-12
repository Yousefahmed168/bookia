import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';
import '../../data/models/governorate.dart';

abstract class PlaceOrderRepo {
  Future<Either<Failure, List<Governorate>>> getGovernorates();
  Future<Either<Failure, bool>> placeOrder({
    required String name,
    required String email,
    required String phone,
    required String address,
    required int governorateId,
  });
}
