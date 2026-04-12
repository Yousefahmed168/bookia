import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/wishlist/domain/repo/wishlist_repo.dart';
import 'package:dartz/dartz.dart';
import '../../data/models/wishlist_response/data.dart';

class GetWishlistUseCase {
  final WishlistRepo repository;

  GetWishlistUseCase(this.repository);

  Future<Either<Failure, Data>> call() async {
    return await repository.getWishlist();
  }
}

class AddToWishlistUseCase {
  final WishlistRepo repository;

  AddToWishlistUseCase(this.repository);

  Future<Either<Failure, Data>> call(int productId) async {
    return await repository.addToWishlist(productId);
  }
}

class RemoveFromWishlistUseCase {
  final WishlistRepo repository;

  RemoveFromWishlistUseCase(this.repository);

  Future<Either<Failure, Data>> call(int productId) async {
    return await repository.removeFromWishlist(productId);
  }
}
