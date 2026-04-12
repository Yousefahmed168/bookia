import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/services/dio/apis.dart';
import '../../../../core/services/dio/dio_provider.dart';
import '../../../../core/services/local/shared_pref.dart';
import '../models/governorate.dart';

class PlaceOrderRepo {
  static Future<Either<Failure, List<Governorate>>> getGovernorates() async {
    var response = await DioProvider.getApi(endpoint: Apis.governorates);

    return response.fold(
      (l) => Left(l),
      (right) {
        try {
          var list = right as List<dynamic>;
          var governoratesList = list
              .map((e) => Governorate.fromJson(e as Map<String, dynamic>))
              .toList();
          return Right(governoratesList);
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
