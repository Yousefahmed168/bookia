import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:dartz/dartz.dart';

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  @override
  Future<Either<Failure, dynamic>> getSliders() async {
    return await DioProvider.getApi(endpoint: Apis.sliders);
  }

  @override
  Future<Either<Failure, dynamic>> getBestSeller() async {
    return await DioProvider.getApi(endpoint: Apis.productsBestseller);
  }
}
