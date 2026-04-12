import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/wishlist/data/data_sources/wishlist_remote_data_source.dart';
import 'package:dartz/dartz.dart';

class WishlistRemoteDataSourceImpl implements WishlistRemoteDataSource {
  @override
  Future<Either<Failure, dynamic>> getWishlist() async {
    final token = SharedPref.getToken();
    return await DioProvider.getApi(
      endpoint: Apis.wishlist,
      queryParameters: {"page": 1},
      headers: {"Authorization": "Bearer $token"},
    );
  }

  @override
  Future<Either<Failure, dynamic>> addToWishlist(int productId) async {
    final token = SharedPref.getToken();
    return await DioProvider.postApi(
      endpoint: Apis.addToWishlist,
      queryParameters: {"page": 1},
      data: {"product_id": productId},
      headers: {"Authorization": "Bearer $token"},
    );
  }

  @override
  Future<Either<Failure, dynamic>> removeFromWishlist(int productId) async {
    final token = SharedPref.getToken();
    return await DioProvider.postApi(
      endpoint: Apis.removeFromWishlist,
      queryParameters: {"page": 1},
      data: {"product_id": productId},
      headers: {"Authorization": "Bearer $token"},
    );
  }
}
