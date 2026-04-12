import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';
import '../../data/models/wishlist_response/data.dart';

abstract class WishlistRepo {
  Future<Either<Failure, Data>> getWishlist();
  Future<Either<Failure, Data>> addToWishlist(int productId);
  Future<Either<Failure, Data>> removeFromWishlist(int productId);
}
