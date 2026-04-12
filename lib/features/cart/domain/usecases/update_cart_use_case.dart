import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/cart/domain/repo/cart_repo.dart';
import 'package:dartz/dartz.dart';
import '../../data/models/cart_response/data.dart';

class UpdateCartUseCase {
  final CartRepo repository;

  UpdateCartUseCase(this.repository);

  Future<Either<Failure, Data>> call(int cartItemId, int quantity) async {
    return await repository.updateCart(cartItemId, quantity);
  }
}
