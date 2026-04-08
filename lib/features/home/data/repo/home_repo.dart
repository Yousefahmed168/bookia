import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/services/dio/apis.dart';
import '../../../../core/services/dio/dio_provider.dart';
import '../models/best_seller_books_response/best_seller_books_response.dart';
import '../models/slider_response/slider_response.dart';

class HomeRepo {
  static Future<Either<Failure, SliderResponse>> getSliders() async {
    var response = await DioProvider.getApi(endpoint: Apis.sliders);
    return response.fold(
      (l) => Left(l),
      (right) => Right(SliderResponse.fromJson(right)),
    );
  }

  static Future<Either<Failure, BestSellerBooksResponse>> getBestSeller() async {
    var response = await DioProvider.getApi(endpoint: Apis.productsBestseller);
    return response.fold(
      (l) => Left(l),
      (right) => Right(BestSellerBooksResponse.fromJson(right)),
    );
  }
}
