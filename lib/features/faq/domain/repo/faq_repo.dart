import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';
import '../../data/models/faq_model.dart';

abstract class FaqRepo {
  Future<Either<Failure, List<FaqModel>>> getFaqs();
}
