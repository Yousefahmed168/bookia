import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/contact_us/data/data_sources/contact_us_remote_data_source.dart';
import 'package:dartz/dartz.dart';

class ContactUsRemoteDataSourceImpl implements ContactUsRemoteDataSource {
  @override
  Future<Either<Failure, dynamic>> sendMessage({
    required String name,
    required String email,
    required String subject,
    required String message,
  }) async {
    final token = SharedPref.getToken();
    return await DioProvider.postApi(
      endpoint: Apis.contactUs,
      headers: {'Authorization': 'Bearer $token'},
      data: {
        'name': name,
        'email': email,
        'subject': subject,
        'message': message,
      },
    );
  }
}
