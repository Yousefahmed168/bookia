import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';

abstract class MyOrdersRemoteDataSource {
  Future<Either<Failure, dynamic>> getOrders();
}
