import '../../data/models/order_details_response/data.dart';
import '../../domain/usecases/get_order_details_use_case.dart';
import 'order_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  final GetOrderDetailsUseCase getOrderDetailsUseCase;
  OrderDetailsCubit(this.getOrderDetailsUseCase) : super(OrderDetailsInitial());

  Data? orderDetailsResponse;

  Future<void> getOrderDetails(int orderId) async {
    emit(OrderDetailsLoading());
    var response = await getOrderDetailsUseCase(orderId);

    response.fold(
      (l) => emit(OrderDetailsError(message: l.message)),
      (r) {
        orderDetailsResponse = r;
        emit(OrderDetailsLoaded());
      },
    );
  }
}
