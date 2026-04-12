import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/cart/data/data_sources/cart_remote_data_source.dart';
import 'package:bookia/features/cart/domain/repo/cart_repo.dart';
import 'package:dartz/dartz.dart';
import '../models/cart_response/data.dart';

class CartRepoImpl implements CartRepo {
  final CartRemoteDataSource remoteDataSource;

  CartRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, Data>> getCart() async {
    var response = await remoteDataSource.getCart();
    return response.fold(
      (l) => Left(l),
      (right) {
        try {
          return Right(Data.fromJson(right as Map<String, dynamic>));
        } catch (e) {
          return Left(ParseFailure(message: 'Error parsing cart data'));
        }
      },
    );
  }

  @override
  Future<Either<Failure, Data>> addToCart(int productId) async {
    var response = await remoteDataSource.addToCart(productId);
    return response.fold(
      (l) => Left(l),
      (right) {
        try {
          return Right(Data.fromJson(right as Map<String, dynamic>));
        } catch (e) {
          return Left(ParseFailure(message: 'Error parsing cart data'));
        }
      },
    );
  }

  @override
  Future<Either<Failure, Data>> removeFromCart(int cartItemId) async {
    var response = await remoteDataSource.removeFromCart(cartItemId);
    return response.fold(
      (l) => Left(l),
      (right) {
        try {
          return Right(Data.fromJson(right as Map<String, dynamic>));
        } catch (e) {
          return Left(ParseFailure(message: 'Error parsing cart data'));
        }
      },
    );
  }

  @override
  Future<Either<Failure, Data>> updateCart(int cartItemId, int quantity) async {
    var response = await remoteDataSource.updateCart(cartItemId, quantity);
    return response.fold(
      (l) => Left(l),
      (right) {
        try {
          return Right(Data.fromJson(right as Map<String, dynamic>));
        } catch (e) {
          return Left(ParseFailure(message: 'Error parsing cart data'));
        }
      },
    );
  }

  @override
  Future<Either<Failure, bool>> checkout() async {
    var response = await remoteDataSource.checkout();
    return response.fold(
      (l) => Left(l),
      (right) => const Right(true),
    );
  }
}
