
import '../../data/models/governorate.dart';
import '../../data/repo/place_order_repo.dart';
import 'place_order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaceOrderCubit extends Cubit<PlaceOrderState> {
  PlaceOrderCubit() : super(PlaceOrderInitial());

  List<Governorate> governorates = [];

  Future<void> getGovernorates() async {
    emit(GovernoratesLoadingState());
    var response = await PlaceOrderRepo.getGovernorates();

    response.fold(
      (l) => emit(GovernoratesErrorState(message: l.message)),
      (r) {
        governorates = r;
        emit(GovernoratesSuccessState());
      },
    );
  }

  Future<void> placeOrder({
    required String name,
    required String email,
    required String phone,
    required String address,
    required int governorateId,
  }) async {
    emit(PlaceOrderLoading());
    var response = await PlaceOrderRepo.placeOrder(
      name: name,
      email: email,
      phone: phone,
      address: address,
      governorateId: governorateId,
    );

    response.fold(
      (l) => emit(PlaceOrderError(l.message)),
      (r) => emit(PlaceOrderSuccess()),
    );
  }
}
