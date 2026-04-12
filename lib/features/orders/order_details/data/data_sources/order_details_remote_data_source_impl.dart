import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/orders/order_details/data/data_sources/order_details_remote_data_source.dart';
import 'package:dartz/dartz.dart';

class OrderDetailsRemoteDataSourceImpl implements OrderDetailsRemoteDataSource {
  @override
  Future<Either<Failure, dynamic>> getOrderDetails(int orderId) async {
    return await DioProvider.getApi(
      endpoint: "${Apis.showSingleOrder}/$orderId",
      headers: {'Authorization': 'Bearer ${SharedPref.getToken()}'},
    );
  }
}
