import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart' hide Order;

import '../../../../../core/services/dio/apis.dart';
import '../../../../../core/services/dio/dio_provider.dart';
import '../../../../../core/services/local/shared_pref.dart';
import '../models/my_orders_response/order.dart';

class MyOrdersRepo {
  static Future<Either<Failure, List<Order>>> getOrders() async {
    final token = SharedPref.getToken();
    var response = await DioProvider.getApi(
      endpoint: Apis.myOrders,
      headers: {'Authorization': 'Bearer $token'},
    );

    return response.fold(
      (l) => Left(l),
      (right) {
        try {
          // Attempt to parse dynamically depending on whether Laravel provided a pure Array or a Map.
          List<dynamic> list;
          if (right is List) {
            list = right;
          } else if (right is Map<String, dynamic>) {
            list = right['data'] ?? right['orders'] ?? [];
          } else {
            list = [];
          }
          
          List<Order> orders = list.map((e) => Order.fromJson(e as Map<String, dynamic>)).toList();
          return Right(orders);
        } catch (e) {
          return Left(ParseFailure(message: 'Error parsing my orders data'));
        }
      },
    );
  }
}
