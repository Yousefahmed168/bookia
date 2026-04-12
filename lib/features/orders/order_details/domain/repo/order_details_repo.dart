import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';
import '../../data/models/order_details_response/data.dart';

abstract class OrderDetailsRepo {
  Future<Either<Failure, Data>> getOrderDetails(int orderId);
}
