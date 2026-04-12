import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';
import '../../data/models/best_seller_books_response/best_seller_books_response.dart';
import '../../data/models/slider_response/slider_response.dart';

abstract class HomeRepo {
  Future<Either<Failure, SliderResponse>> getSliders();
  Future<Either<Failure, BestSellerBooksResponse>> getBestSeller();
}
