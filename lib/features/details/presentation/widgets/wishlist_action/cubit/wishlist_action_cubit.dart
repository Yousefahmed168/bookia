
import '../../../../../../core/services/local/shared_pref.dart';
import 'wishlist_icon_state.dart';
import '../../../../../wishlist/data/repo/wishlist_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistActionCubit extends Cubit<WishlistActionState> {
  WishlistActionCubit() : super(WishlistActionInitial());

  Future<void> addToWishlist(int productId) async {
    emit(WishlistActionLoadingState());
    var response = await WishlistRepo.addToWishlist(productId);

    response.fold(
      (l) => emit(WishlistActionErrorState(message: l.message)),
      (r) {
        var products = r.products ?? [];
        SharedPref.cacheWishlistIds(products);
        emit(WishlistActionSuccessState(msg: 'Added To Wishlist'));
      },
    );
  }

  Future<void> removeFromWishlist(int productId) async {
    emit(WishlistActionLoadingState());
    var response = await WishlistRepo.removeFromWishlist(productId);

    response.fold(
      (l) => emit(WishlistActionErrorState(message: l.message)),
      (r) {
        var products = r.products ?? [];
        SharedPref.cacheWishlistIds(products);
        emit(WishlistActionSuccessState(msg: 'Removed From Wishlist'));
      },
    );
  }

  bool isProductInWishlist(int productId) {
    var wishlistIds = SharedPref.getWishlistIds();
    return wishlistIds.contains(productId);
  }
}
