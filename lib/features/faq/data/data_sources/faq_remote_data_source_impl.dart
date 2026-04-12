import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/faq/data/data_sources/faq_remote_data_source.dart';
import 'package:dartz/dartz.dart';

class FaqRemoteDataSourceImpl implements FaqRemoteDataSource {
  @override
  Future<Either<Failure, dynamic>> getFaqs() async {
    final token = SharedPref.getToken();
    return await DioProvider.getApi(
      endpoint: Apis.faqs,
      headers: {'Authorization': 'Bearer $token'},
    );
  }
}
