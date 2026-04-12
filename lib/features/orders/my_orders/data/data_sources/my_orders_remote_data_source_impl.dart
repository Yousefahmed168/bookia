import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/orders/my_orders/data/data_sources/my_orders_remote_data_source.dart';
import 'package:dartz/dartz.dart';

class MyOrdersRemoteDataSourceImpl implements MyOrdersRemoteDataSource {
  @override
  Future<Either<Failure, dynamic>> getOrders() async {
    return await DioProvider.getApi(
      endpoint: Apis.myOrders,
      headers: {'Authorization': 'Bearer ${SharedPref.getToken()}'},
    );
  }
}
