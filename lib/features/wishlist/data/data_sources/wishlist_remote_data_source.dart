import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';

abstract class WishlistRemoteDataSource {
  Future<Either<Failure, dynamic>> getWishlist();
  Future<Either<Failure, dynamic>> addToWishlist(int productId);
  Future<Either<Failure, dynamic>> removeFromWishlist(int productId);
}
