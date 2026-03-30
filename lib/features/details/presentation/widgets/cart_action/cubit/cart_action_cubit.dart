import '../../../../../../core/services/local/shared_pref.dart';
import '../../../../../cart/data/repo/cart_repo.dart';
import 'cart_action_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartActionCubit extends Cubit<CartActionState> {
  CartActionCubit() : super(CartActionInitial());

  Future<void> addToCart(int productId) async {
    emit(CartActionLoadingState());
    var data = await CartRepo.addToCart(productId);
    if (data != null) {
      var products = data.data?.cartItems ?? [];
      SharedPref.cacheCartIds(products);
      emit(CartActionSuccessState(msg: 'Added To Cart'));
    } else {
      emit(CartActionErrorState());
    }
  }

  Future<void> removeFromCart(int productId) async {
    emit(CartActionLoadingState());
    var data = await CartRepo.removeFromCart(productId);
    if (data != null) {
      var products = data.data?.cartItems ?? [];
      SharedPref.cacheCartIds(products);
      emit(CartActionSuccessState(msg: 'Removed From Cart'));
    } else {
      emit(CartActionErrorState());
    }
  }

  bool isProductInCart(int productId) {
    var cartIds = SharedPref.getCartIds();
    return cartIds.contains(productId);
  }
}
