
import '../../data/models/my_orders_response/my_orders_response.dart';
import '../../data/repo/my_orders_repo.dart';
import 'my_orders_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrderCubit extends Cubit<MyOrdersState> {
  MyOrderCubit() : super(MyOrdersInitial());

  MyOrdersResponse? myOrdersResponse;

  Future<void> getOrders() async {
    emit(MyOrdersLoading());
    var response = await MyOrdersRepo.getOrders();

    response.fold(
      (l) => emit(MyOrdersError(message: l.message)),
      (r) {
        myOrdersResponse = r;
        emit(MyOrdersLoaded());
      },
    );
  }
}
