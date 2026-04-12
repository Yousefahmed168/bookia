import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/place_order/data/data_sources/place_order_remote_data_source.dart';
import 'package:dartz/dartz.dart';

class PlaceOrderRemoteDataSourceImpl implements PlaceOrderRemoteDataSource {
  @override
  Future<Either<Failure, dynamic>> getGovernorates() async {
    return await DioProvider.getApi(endpoint: Apis.governorates);
  }

  @override
  Future<Either<Failure, dynamic>> placeOrder(Map<String, dynamic> data) async {
    return await DioProvider.postApi(
      endpoint: Apis.placeOrder,
      data: data,
      headers: {'Authorization': 'Bearer ${SharedPref.getToken()}'},
    );
  }
}
