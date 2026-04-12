import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/cart/data/data_sources/cart_remote_data_source.dart';
import 'package:dartz/dartz.dart';

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  @override
  Future<Either<Failure, dynamic>> getCart() async {
    return await DioProvider.getApi(
      endpoint: Apis.cart,
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );
  }

  @override
  Future<Either<Failure, dynamic>> addToCart(int productId) async {
    return await DioProvider.postApi(
      endpoint: Apis.addToCart,
      data: {"product_id": productId},
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );
  }

  @override
  Future<Either<Failure, dynamic>> removeFromCart(int cartItemId) async {
    return await DioProvider.postApi(
      endpoint: Apis.removeFromCart,
      data: {"cart_item_id": cartItemId},
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );
  }

  @override
  Future<Either<Failure, dynamic>> updateCart(int cartItemId, int quantity) async {
    return await DioProvider.postApi(
      endpoint: Apis.updateCart,
      data: {"cart_item_id": cartItemId, "quantity": quantity},
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );
  }

  @override
  Future<Either<Failure, dynamic>> checkout() async {
    return await DioProvider.getApi(
      endpoint: Apis.checkout,
      headers: {"Authorization": "Bearer ${SharedPref.getToken()}"},
    );
  }
}
