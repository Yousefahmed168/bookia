import '../../../../core/services/local/shared_pref.dart';
import '../../data/models/cart_response/cart_item.dart';
import '../../data/repo/cart_repo.dart';
import 'cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  List<CartItem> products = [];
  String total = '';

  Future<void> getCart() async {
    emit(CartLoadingState());
    var data = await CartRepo.getCart();
    if (data != null) {
      products = data.data?.cartItems ?? [];
      total = data.data?.total ?? '';
      SharedPref.cacheCartIds(products);
      emit(CartSuccessState());
    } else {
      emit(CartErrorState());
    }
  }

  Future<void> removeFromCart(int cartItemId) async {
    emit(CartLoadingState());
    var data = await CartRepo.removeFromCart(cartItemId);
    if (data != null) {
      await getCart();
    } else {
      emit(CartErrorState());
    }
  }

  Future<void> updateCart(int cartItemId, int quantity) async {
    emit(CartLoadingState());
    var data = await CartRepo.updateCart(cartItemId, quantity);
    if (data != null) {
      await getCart();
    } else {
      emit(CartErrorState());
    }
  }

  Future<void> checkout() async {
    emit(CheckoutLoadingState());
    var success = await CartRepo.checkout();
    if (success) {
      emit(CheckoutSuccessState());
    } else {
      emit(CheckoutErrorState());
    }
  }
}
