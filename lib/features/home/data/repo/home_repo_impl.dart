import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookia/features/home/domain/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import '../models/best_seller_books_response/best_seller_books_response.dart';
import '../models/slider_response/slider_response.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource remoteDataSource;

  HomeRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, SliderResponse>> getSliders() async {
    var response = await remoteDataSource.getSliders();
    return response.fold(
      (l) => Left(l),
      (r) => Right(SliderResponse.fromJson(r)),
    );
  }

  @override
  Future<Either<Failure, BestSellerBooksResponse>> getBestSeller() async {
    var response = await remoteDataSource.getBestSeller();
    return response.fold(
      (l) => Left(l),
      (r) => Right(BestSellerBooksResponse.fromJson(r)),
    );
  }
}
