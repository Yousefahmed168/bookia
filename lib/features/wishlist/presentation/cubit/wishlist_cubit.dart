import '../../../home/data/models/best_seller_books_response/product.dart';
import '../../data/repo/wishlist_repo.dart';
import 'wishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial());

  List<Product> products = [];

  Future<void> getWishlist() async {
    emit(WishlistLoadingState());
    var data = await WishlistRepo.getWishlist();
    if (data != null) {
      products = data.data?.products ?? [];
      emit(WishlistSuccessState());
    } else {
      emit(WishlistErrorState());
    }
  }

  Future<void> removeFromWishlist(int productId) async {
    emit(WishlistLoadingState());
    var data = await WishlistRepo.removeFromWishlist(productId);
    if (data != null) {
      products = data.data?.products ?? [];
      emit(WishlistSuccessState());
    } else {
      emit(WishlistErrorState());
    }
  }
}
