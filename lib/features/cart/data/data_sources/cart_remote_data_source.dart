import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CartRemoteDataSource {
  Future<Either<Failure, dynamic>> getCart();
  Future<Either<Failure, dynamic>> addToCart(int productId);
  Future<Either<Failure, dynamic>> removeFromCart(int cartItemId);
  Future<Either<Failure, dynamic>> updateCart(int cartItemId, int quantity);
  Future<Either<Failure, dynamic>> checkout();
}
