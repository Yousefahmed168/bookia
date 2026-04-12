import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/orders/order_details/data/data_sources/order_details_remote_data_source.dart';
import 'package:bookia/features/orders/order_details/domain/repo/order_details_repo.dart';
import 'package:dartz/dartz.dart';
import '../models/order_details_response/data.dart';

class OrderDetailsRepoImpl implements OrderDetailsRepo {
  final OrderDetailsRemoteDataSource remoteDataSource;

  OrderDetailsRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, Data>> getOrderDetails(int orderId) async {
    var response = await remoteDataSource.getOrderDetails(orderId);
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
