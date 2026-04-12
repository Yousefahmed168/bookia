import '../../data/models/governorate.dart';
import '../../domain/usecases/place_order_use_cases.dart';
import 'place_order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaceOrderCubit extends Cubit<PlaceOrderState> {
  final GetGovernoratesUseCase getGovernoratesUseCase;
  final PlaceOrderUseCase placeOrderUseCase;

  PlaceOrderCubit({
    required this.getGovernoratesUseCase,
    required this.placeOrderUseCase,
  }) : super(PlaceOrderInitial());

  List<Governorate> governorates = [];

  Future<void> getGovernorates() async {
    emit(GovernoratesLoadingState());
    var response = await getGovernoratesUseCase();

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
    var response = await placeOrderUseCase(
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
