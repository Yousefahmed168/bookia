import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../core/services/dio/apis.dart';
import '../../../core/services/dio/dio_provider.dart';
import '../../../core/services/local/shared_pref.dart';

class ContactUsRepo {
  static Future<Either<Failure, bool>> sendMessage({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    final token = SharedPref.getToken();
    var response = await DioProvider.postApi(
      endpoint: Apis.contactUs,
      headers: {'Authorization': 'Bearer $token'},
      data: {
        'name': name,
        'email': email,
        'subject': subject,
        'message': message,
      },
    );

    return response.fold(
      (l) => Left(l),
      (r) => const Right(true),
    );
  }
}