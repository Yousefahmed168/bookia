import '../../../../core/services/local/shared_pref.dart';
import '../../data/models/cart_response/cart_item.dart';
import '../../domain/usecases/checkout_use_case.dart';
import '../../domain/usecases/get_cart_use_case.dart';
import '../../domain/usecases/remove_from_cart_use_case.dart';
import '../../domain/usecases/update_cart_use_case.dart';
import 'cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  final GetCartUseCase getCartUseCase;
  final RemoveFromCartUseCase removeFromCartUseCase;
  final UpdateCartUseCase updateCartUseCase;
  final CheckoutUseCase checkoutUseCase;

  CartCubit({
    required this.getCartUseCase,
    required this.removeFromCartUseCase,
    required this.updateCartUseCase,
    required this.checkoutUseCase,
  }) : super(CartInitial());

  List<CartItem> products = [];
  String total = '';

  Future<void> getCart() async {
    emit(CartLoadingState());
    var response = await getCartUseCase();
    response.fold(
      (l) => emit(CartErrorState(message: l.message)),
      (r) {
        products = r.cartItems ?? [];
        total = r.total.toString();
        SharedPref.cacheCartIds(products);
        emit(CartSuccessState());
      },
    );
  }

  Future<void> removeFromCart(int cartItemId) async {
    emit(CartLoadingState());
    var response = await removeFromCartUseCase(cartItemId);
    response.fold(
      (l) => emit(CartErrorState(message: l.message)),
      (r) => getCart(),
    );
  }

  Future<void> updateCart(int cartItemId, int quantity) async {
    emit(CartLoadingState());
    var response = await updateCartUseCase(cartItemId, quantity);
    response.fold(
      (l) => emit(CartErrorState(message: l.message)),
      (r) => getCart(),
    );
  }

  Future<void> checkout() async {
    emit(CheckoutLoadingState());
    var response = await checkoutUseCase();
    response.fold(
      (l) => emit(CheckoutErrorState(message: l.message)),
      (r) => emit(CheckoutSuccessState()),
    );
  }
}
