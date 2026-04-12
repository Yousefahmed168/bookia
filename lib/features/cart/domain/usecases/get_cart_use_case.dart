import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/cart/domain/repo/cart_repo.dart';
import 'package:dartz/dartz.dart';
import '../../data/models/cart_response/data.dart';

class GetCartUseCase {
  final CartRepo repository;

  GetCartUseCase(this.repository);

  Future<Either<Failure, Data>> call() async {
    return await repository.getCart();
  }
}
