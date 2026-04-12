import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart' hide Order;
import '../../data/models/my_orders_response/order.dart';

abstract class MyOrdersRepo {
  Future<Either<Failure, List<Order>>> getOrders();
}
