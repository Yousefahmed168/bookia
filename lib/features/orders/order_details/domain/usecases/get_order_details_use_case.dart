import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/orders/order_details/domain/repo/order_details_repo.dart';
import 'package:dartz/dartz.dart';
import '../../data/models/order_details_response/data.dart';

class GetOrderDetailsUseCase {
  final OrderDetailsRepo repository;

  GetOrderDetailsUseCase(this.repository);

  Future<Either<Failure, Data>> call(int orderId) async {
    return await repository.getOrderDetails(orderId);
  }
}
