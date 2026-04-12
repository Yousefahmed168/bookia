import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';

abstract class OrderDetailsRemoteDataSource {
  Future<Either<Failure, dynamic>> getOrderDetails(int orderId);
}
