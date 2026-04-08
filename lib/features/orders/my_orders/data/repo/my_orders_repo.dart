import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/services/dio/apis.dart';
import '../../../../../core/services/dio/dio_provider.dart';
import '../../../../../core/services/local/shared_pref.dart';
import '../models/my_orders_response/my_orders_response.dart';

class MyOrdersRepo {
  static Future<Either<Failure, MyOrdersResponse>> getOrders() async {
    final token = SharedPref.getToken();
    var response = await DioProvider.getApi(
      endpoint: Apis.myOrders,
      headers: {'Authorization': 'Bearer $token'},
    );

    return response.fold(
      (l) => Left(l),
      (right) => Right(MyOrdersResponse.fromJson(right)),
    );
  }
}
