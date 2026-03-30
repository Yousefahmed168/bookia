import '../../data/models/governorate.dart';
import '../../data/repo/place_order_repo.dart';
import 'place_order_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaceOrderCubit extends Cubit<PlaceOrderState> {
  PlaceOrderCubit() : super(PlaceOrderInitial());

  List<Governorate> governorates = [];

  Future<void> getGovernorates() async {
    emit(GovernoratesLoadingState());
    var data = await PlaceOrderRepo.getGovernorates();
    if (data != null && data.data != null) {
      governorates = data.data ?? [];
      emit(GovernoratesSuccessState());
    } else {
      emit(GovernoratesErrorState());
    }
  }
}
