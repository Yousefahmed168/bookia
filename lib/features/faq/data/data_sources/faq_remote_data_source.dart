import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';

abstract class FaqRemoteDataSource {
  Future<Either<Failure, dynamic>> getFaqs();
}
