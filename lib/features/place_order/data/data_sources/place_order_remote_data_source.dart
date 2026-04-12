import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';

abstract class PlaceOrderRemoteDataSource {
  Future<Either<Failure, dynamic>> getGovernorates();
  Future<Either<Failure, dynamic>> placeOrder(Map<String, dynamic> data);
}
