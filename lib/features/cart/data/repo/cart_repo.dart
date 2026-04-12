import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/services/dio/apis.dart';
import '../../../../core/services/dio/dio_provider.dart';
import '../../../../core/services/local/shared_pref.dart';
import '../models/cart_response/data.dart';

class CartRepo {
  static Future<Either<Failure, Data>> getCart() async {
    var response = await DioProvider.getApi(
      endpoint: Apis.cart,
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );

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

  static Future<Either<Failure, Data>> addToCart(int productId) async {
    var response = await DioProvider.postApi(
      endpoint: Apis.addToCart,
      data: {"product_id": productId},
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );

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

  static Future<Either<Failure, Data>> removeFromCart(
      int cartItemId) async {
    var response = await DioProvider.postApi(
      endpoint: Apis.removeFromCart,
      data: {"cart_item_id": cartItemId},
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );

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

  static Future<Either<Failure, Data>> updateCart(
      int cartItemId, int quantity) async {
    var response = await DioProvider.postApi(
      endpoint: Apis.updateCart,
      data: {"cart_item_id": cartItemId, "quantity": quantity},
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );

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

  static Future<Either<Failure, bool>> checkout() async {
    var response = await DioProvider.getApi(
      endpoint: Apis.checkout,
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );

    return response.fold(
      (l) => Left(l),
      (right) => const Right(true),
    );
  }
}
