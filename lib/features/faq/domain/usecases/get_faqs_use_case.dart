import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/faq/domain/repo/faq_repo.dart';
import 'package:dartz/dartz.dart';
import '../../data/models/faq_model.dart';

class GetFaqsUseCase {
  final FaqRepo repository;

  GetFaqsUseCase(this.repository);

  Future<Either<Failure, List<FaqModel>>> call() async {
    return await repository.getFaqs();
  }
}
