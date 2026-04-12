import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRemoteDataSource {
  Future<Either<Failure, dynamic>> getSliders();
  Future<Either<Failure, dynamic>> getBestSeller();
}
