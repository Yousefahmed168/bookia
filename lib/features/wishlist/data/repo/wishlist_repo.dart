import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/services/dio/apis.dart';
import '../../../../core/services/dio/dio_provider.dart';
import '../../../../core/services/local/shared_pref.dart';
import '../models/wishlist_response/data.dart';

class WishlistRepo {
  static Future<Either<Failure, Data>> getWishlist() async {
    var response = await DioProvider.getApi(
      endpoint: Apis.wishlist,
      queryParameters: {"page": 1},
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );

    return response.fold(
      (l) => Left(l),
      // right is already the inner `data` Map (paginated object)
      (right) => Right(Data.fromJson(right as Map<String, dynamic>)),
    );
  }

  static Future<Either<Failure, Data>> addToWishlist(int productId) async {
    var response = await DioProvider.postApi(
      endpoint: Apis.addToWishlist,
      queryParameters: {"page": 1},
      data: {"product_id": productId},
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );

    return response.fold(
      (l) => Left(l),
      // add-to-wishlist returns a List as `data` — wrap it for Data.fromJson
      (right) => Right(Data.fromJson({"data": right is List ? right : []})),
    );
  }

  static Future<Either<Failure, Data>> removeFromWishlist(int productId) async {
    var response = await DioProvider.postApi(
      endpoint: Apis.removeFromWishlist,
      queryParameters: {"page": 1},
      data: {"product_id": productId},
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );

    return response.fold(
      (l) => Left(l),
      // remove-from-wishlist also returns a List as `data`
      (right) => Right(Data.fromJson({"data": right is List ? right : []})),
    );
  }
}
