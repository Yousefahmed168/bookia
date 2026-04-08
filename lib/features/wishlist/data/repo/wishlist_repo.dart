import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/services/dio/apis.dart';
import '../../../../core/services/dio/dio_provider.dart';
import '../../../../core/services/local/shared_pref.dart';
import '../models/wishlist_response/wishlist_response.dart';

class WishlistRepo {
  static Future<Either<Failure, WishlistResponse>> getWishlist() async {
    var response = await DioProvider.getApi(
      endpoint: Apis.wishlist,
      queryParameters: {"page": 1},
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );

    return response.fold(
      (l) => Left(l),
      (right) => Right(WishlistResponse.fromJson(right)),
    );
  }

  static Future<Either<Failure, WishlistResponse>> addToWishlist(
    int productId,
  ) async {
    var response = await DioProvider.postApi(
      endpoint: Apis.addToWishlist,
      queryParameters: {"page": 1},
      data: {"product_id": productId},
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );

    return response.fold(
      (l) => Left(l),
      (right) => Right(WishlistResponse.fromJson(right)),
    );
  }

  static Future<Either<Failure, WishlistResponse>> removeFromWishlist(
    int productId,
  ) async {
    var response = await DioProvider.postApi(
      endpoint: Apis.removeFromWishlist,
      queryParameters: {"page": 1},
      data: {"product_id": productId},
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );

    return response.fold(
      (l) => Left(l),
      (right) => Right(WishlistResponse.fromJson(right)),
    );
  }
}
