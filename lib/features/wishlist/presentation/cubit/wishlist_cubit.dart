
import '../../../home/data/models/best_seller_books_response/product.dart';
import '../../data/repo/wishlist_repo.dart';
import 'wishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial());

  List<Product> products = [];

  Future<void> getWishlist() async {
    emit(WishlistLoadingState());
    var response = await WishlistRepo.getWishlist();

    response.fold(
      (l) => emit(WishlistErrorState(message: l.message)),
      (r) {
        products = r.data?.products ?? [];
        emit(WishlistSuccessState());
      },
    );
  }

  Future<void> removeFromWishlist(int productId) async {
    emit(WishlistLoadingState());
    var response = await WishlistRepo.removeFromWishlist(productId);

    response.fold(
      (l) => emit(WishlistErrorState(message: l.message)),
      (r) {
        products = r.data?.products ?? [];
        emit(WishlistSuccessState());
      },
    );
  }
}
