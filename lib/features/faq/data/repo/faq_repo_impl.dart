import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/faq/data/data_sources/faq_remote_data_source.dart';
import 'package:bookia/features/faq/domain/repo/faq_repo.dart';
import 'package:dartz/dartz.dart';
import '../models/faq_model.dart';

class FaqRepoImpl implements FaqRepo {
  final FaqRemoteDataSource remoteDataSource;

  FaqRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<FaqModel>>> getFaqs() async {
    var response = await remoteDataSource.getFaqs();

    return response.fold(
      (failure) => Left(failure),
      (data) {
        try {
          if (data['data'] == null || data['data']['faqs'] == null) {
            return Left(ParseFailure(message: 'Invalid response format'));
          }
          final faqsList = data['data']['faqs'] as List;
          if (faqsList.isEmpty) {
            // Fallback to static FAQ data if empty as per old implementation
            return Right([
              FaqModel(
                id: 1,
                question: 'How to place an order?',
                answer: 'You can place an order by adding books to your cart and proceeding to checkout.',
              ),
              FaqModel(
                id: 2,
                question: 'How to track my order?',
                answer: 'You can track your order from the My Orders section in your profile.',
              ),
              FaqModel(
                id: 3,
                question: 'What payment methods are accepted?',
                answer: 'We accept cash on delivery and online payment.',
              ),
            ]);
          }
          return Right(faqsList.map((e) => FaqModel.fromJson(e)).toList());
        } catch (e) {
          return Left(ParseFailure(message: 'Error parsing FAQ data'));
        }
      },
    );
  }
}
