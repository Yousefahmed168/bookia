import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import '../../data/models/best_seller_books_response/best_seller_books_response.dart';
import '../../data/models/slider_response/slider_response.dart';

class GetSlidersUseCase {
  final HomeRepo repository;

  GetSlidersUseCase(this.repository);

  Future<Either<Failure, SliderResponse>> call() async {
    return await repository.getSliders();
  }
}

class GetBestSellerUseCase {
  final HomeRepo repository;

  GetBestSellerUseCase(this.repository);

  Future<Either<Failure, BestSellerBooksResponse>> call() async {
    return await repository.getBestSeller();
  }
}
