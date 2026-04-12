import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/cart/domain/repo/cart_repo.dart';
import 'package:dartz/dartz.dart';

class CheckoutUseCase {
  final CartRepo repository;

  CheckoutUseCase(this.repository);

  Future<Either<Failure, bool>> call() async {
    return await repository.checkout();
  }
}
