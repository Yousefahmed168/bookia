import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';

abstract class ContactUsRemoteDataSource {
  Future<Either<Failure, dynamic>> sendMessage({
    required String name,
    required String email,
    required String subject,
    required String message,
  });
}
