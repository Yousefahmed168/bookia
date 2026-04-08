import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/services/dio/apis.dart';
import '../../../../core/services/dio/dio_provider.dart';
import '../../../../core/services/local/shared_pref.dart';
import '../models/governorates_response.dart';

class PlaceOrderRepo {
  static Future<Either<Failure, GovernoratesResponse>> getGovernorates() async {
    var response = await DioProvider.getApi(endpoint: Apis.governorates);

    return response.fold(
      (l) => Left(l),
      (right) {
        try {
          return Right(GovernoratesResponse.fromJson(right));
        } catch (e) {
          return Left(ParseFailure(message: 'Error parsing governorates data'));
        }
      },
    );
  }

  static Future<Either<Failure, bool>> placeOrder({
    required String name,
    required String email,
    required String phone,
    required String address,
    required int governorateId,
  }) async {
    var response = await DioProvider.postApi(
      endpoint: Apis.placeOrder,
      data: {
        'name': name,
        'email': email,
        'phone': phone,
        'address': address,
        'governorate_id': governorateId,
      },
      headers: {'Authorization': 'Bearer ${SharedPref.getToken()}'},
    );

    return response.fold(
      (l) => Left(l),
      (right) => const Right(true),
    );
  }
}
