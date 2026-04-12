import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/cart/domain/repo/cart_repo.dart';
import 'package:dartz/dartz.dart';
import '../../data/models/cart_response/data.dart';

class AddToCartUseCase {
  final CartRepo repository;

  AddToCartUseCase(this.repository);

  Future<Either<Failure, Data>> call(int productId) async {
    return await repository.addToCart(productId);
  }
}
