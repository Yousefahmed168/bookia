import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/wishlist/data/data_sources/wishlist_remote_data_source.dart';
import 'package:bookia/features/wishlist/domain/repo/wishlist_repo.dart';
import 'package:dartz/dartz.dart';
import '../models/wishlist_response/data.dart';

class WishlistRepoImpl implements WishlistRepo {
  final WishlistRemoteDataSource remoteDataSource;

  WishlistRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, Data>> getWishlist() async {
    var response = await remoteDataSource.getWishlist();
    return response.fold(
      (l) => Left(l),
      (right) {
        try {
          return Right(Data.fromJson(right as Map<String, dynamic>));
        } catch (e) {
          return Left(ParseFailure(message: 'Error parsing wishlist data'));
        }
      },
    );
  }

  @override
  Future<Either<Failure, Data>> addToWishlist(int productId) async {
    var response = await remoteDataSource.addToWishlist(productId);
    return response.fold(
      (l) => Left(l),
      (right) {
        try {
          return Right(Data.fromJson({"data": right is List ? right : []}));
        } catch (e) {
          return Left(ParseFailure(message: 'Error parsing wishlist data'));
        }
      },
    );
  }

  @override
  Future<Either<Failure, Data>> removeFromWishlist(int productId) async {
    var response = await remoteDataSource.removeFromWishlist(productId);
    return response.fold(
      (l) => Left(l),
      (right) {
        try {
          return Right(Data.fromJson({"data": right is List ? right : []}));
        } catch (e) {
          return Left(ParseFailure(message: 'Error parsing wishlist data'));
        }
      },
    );
  }
}
