import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/services/dio/apis.dart';
import '../../../../../core/services/dio/dio_provider.dart';
import '../../../../../core/services/local/shared_pref.dart';
import '../models/order_details_response/data.dart';

class OrderDetailsRepo {
  static Future<Either<Failure, Data>> getOrderDetails(
    int orderId,
  ) async {
    final token = SharedPref.getToken();

    var response = await DioProvider.getApi(
      endpoint: "${Apis.showSingleOrder}/$orderId",
      headers: {'Authorization': 'Bearer $token'},
    );

    return response.fold(
      (l) => Left(l),
      (right) {
        try {
          return Right(Data.fromJson(right as Map<String, dynamic>));
        } catch (e) {
          return Left(ParseFailure(message: 'Error parsing order details'));
        }
      },
    );
  }
}
