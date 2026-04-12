import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/place_order/domain/repo/place_order_repo.dart';
import 'package:dartz/dartz.dart';
import '../../data/models/governorate.dart';

class GetGovernoratesUseCase {
  final PlaceOrderRepo repository;

  GetGovernoratesUseCase(this.repository);

  Future<Either<Failure, List<Governorate>>> call() async {
    return await repository.getGovernorates();
  }
}

class PlaceOrderUseCase {
  final PlaceOrderRepo repository;

  PlaceOrderUseCase(this.repository);

  Future<Either<Failure, bool>> call({
    required String name,
    required String email,
    required String phone,
    required String address,
    required int governorateId,
  }) async {
    return await repository.placeOrder(
      name: name,
      email: email,
      phone: phone,
      address: address,
      governorateId: governorateId,
    );
  }
}
