import 'package:bookia/core/services/dio/failure.dart';
import 'package:bookia/features/orders/my_orders/data/data_sources/my_orders_remote_data_source.dart';
import 'package:bookia/features/orders/my_orders/domain/repo/my_orders_repo.dart';
import 'package:dartz/dartz.dart' hide Order;
import '../models/my_orders_response/order.dart';

class MyOrdersRepoImpl implements MyOrdersRepo {
  final MyOrdersRemoteDataSource remoteDataSource;

  MyOrdersRepoImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Order>>> getOrders() async {
    var response = await remoteDataSource.getOrders();
    return response.fold(
      (l) => Left(l),
      (right) {
        try {
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
