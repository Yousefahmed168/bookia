import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/orders/my_orders/domain/repo/my_orders_repo.dart';
import 'package:dartz/dartz.dart' hide Order;
import '../../data/models/my_orders_response/order.dart';

class GetOrdersUseCase {
  final MyOrdersRepo repository;

  GetOrdersUseCase(this.repository);

  Future<Either<Failure, List<Order>>> call() async {
    return await repository.getOrders();
  }
}
