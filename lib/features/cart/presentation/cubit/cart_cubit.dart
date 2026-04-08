
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
    var response = await CartRepo.getCart();
    response.fold(
      (l) => emit(CartErrorState(message: l.message)),
      (r) {
        products = r.data?.cartItems ?? [];
        total = r.data?.total ?? '';
        SharedPref.cacheCartIds(products);
        emit(CartSuccessState());
      },
    );
  }

  Future<void> removeFromCart(int cartItemId) async {
    emit(CartLoadingState());
    var response = await CartRepo.removeFromCart(cartItemId);
    response.fold(
      (l) => emit(CartErrorState(message: l.message)),
      (r) => getCart(),
    );
  }

  Future<void> updateCart(int cartItemId, int quantity) async {
    emit(CartLoadingState());
    var response = await CartRepo.updateCart(cartItemId, quantity);
    response.fold(
      (l) => emit(CartErrorState(message: l.message)),
      (r) => getCart(),
    );
  }

  Future<void> checkout() async {
    emit(CheckoutLoadingState());
    var response = await CartRepo.checkout();
    response.fold(
      (l) => emit(CheckoutErrorState(message: l.message)),
      (r) => emit(CheckoutSuccessState()),
    );
  }
}
