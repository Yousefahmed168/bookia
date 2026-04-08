import '../../../../../../core/services/local/shared_pref.dart';
import '../../../../../cart/data/repo/cart_repo.dart';
import 'cart_action_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartActionCubit extends Cubit<CartActionState> {
  CartActionCubit() : super(CartActionInitial());

  Future<void> addToCart(int productId) async {
    emit(CartActionLoadingState());
    var response = await CartRepo.addToCart(productId);
    response.fold((l) => emit(CartActionErrorState(message: l.message)), (r) {
      var products = r.data?.cartItems ?? [];
      SharedPref.cacheCartIds(products);
      emit(CartActionSuccessState(msg: 'Added To Cart'));
    });
  }

  Future<void> removeFromCart(int productId) async {
    emit(CartActionLoadingState());
    var response = await CartRepo.removeFromCart(productId);
    response.fold((l) => emit(CartActionErrorState(message: l.message)), (r) {
      var products = r.data?.cartItems ?? [];
      SharedPref.cacheCartIds(products);
      emit(CartActionSuccessState(msg: 'Removed From Cart'));
    });
  }

  bool isProductInCart(int productId) {
    var cartIds = SharedPref.getCartIds();
    return cartIds.contains(productId);
  }
}
