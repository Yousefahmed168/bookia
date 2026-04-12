import '../../data/models/my_orders_response/order.dart';
import '../../domain/usecases/get_orders_use_case.dart';
import 'my_orders_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyOrderCubit extends Cubit<MyOrdersState> {
  final GetOrdersUseCase getOrdersUseCase;
  MyOrderCubit(this.getOrdersUseCase) : super(MyOrdersInitial());

  List<Order>? myOrdersResponse;

  Future<void> getOrders() async {
    emit(MyOrdersLoading());
    var response = await getOrdersUseCase();

    response.fold(
      (l) => emit(MyOrdersError(message: l.message)),
      (r) {
        myOrdersResponse = r;
        emit(MyOrdersLoaded());
      },
    );
  }
}
