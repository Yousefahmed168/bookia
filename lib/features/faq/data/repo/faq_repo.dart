import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/services/dio/apis.dart';
import '../../../../core/services/dio/dio_provider.dart';
import '../../../../core/services/local/shared_pref.dart';
import '../models/faq_model.dart';

class FaqRepo {
  static Future<Either<Failure, List<FaqModel>>> getFaqs() async {
    final token = SharedPref.getToken();
    var response = await DioProvider.getApi(
      endpoint: Apis.faqs,
      headers: {'Authorization': 'Bearer $token'},
    );

    return response.fold(
      (failure) => Left(failure),
      (data) {
        try {
          if (data['data'] == null || data['data']['faqs'] == null) {
            return Left(ParseFailure(message: 'Invalid response format'));
          }
          final faqsList = data['data']['faqs'] as List;
          if (faqsList.isEmpty) {
            return Right([
              FaqModel(
                id: 1,
                question: 'How to place an order?',
                answer:
                    'You can place an order by adding books to your cart and proceeding to checkout.',
              ),
              FaqModel(
                id: 2,
                question: 'How to track my order?',
                answer:
                    'You can track your order from the My Orders section in your profile.',
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
