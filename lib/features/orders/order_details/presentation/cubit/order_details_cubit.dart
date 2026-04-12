
import '../../data/models/order_details_response/data.dart';
import '../../data/repo/order_details_repo.dart';
import 'order_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit() : super(OrderDetailsInitial());

  Data? orderDetailsResponse;

  Future<void> getOrderDetails(int orderId) async {
    emit(OrderDetailsLoading());
    var response = await OrderDetailsRepo.getOrderDetails(orderId);

    response.fold(
      (l) => emit(OrderDetailsError(message: l.message)),
      (r) {
        orderDetailsResponse = r;
        emit(OrderDetailsLoaded());
      },
    );
  }
}
