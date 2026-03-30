import 'dart:developer';

import 'package:bookia/core/services/dio/apis.dart';
import 'package:bookia/core/services/dio/dio_provider.dart';
import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/orders/order_details/data/models/order_details_response/order_details_response.dart';

class OrderDetailsRepo {
  static Future<OrderDetailsResponse?> getOrderDetails(int orderId) async {
    try {
      final token = SharedPref.getToken();

      final response = await DioProvider.get(
        endpoint: "${Apis.showSingleOrder}/$orderId",
        headers: {'Authorization': 'Bearer $token'},
      );

      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        return OrderDetailsResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
