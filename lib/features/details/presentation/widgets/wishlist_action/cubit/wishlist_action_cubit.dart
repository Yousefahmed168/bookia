import '../../../../../../core/services/local/shared_pref.dart';
import 'wishlist_icon_state.dart';
import '../../../../../wishlist/data/repo/wishlist_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistActionCubit extends Cubit<WishlistActionState> {
  WishlistActionCubit() : super(WishlistActionInitial());

  Future<void> addToWishlist(int productId) async {
    emit(WishlistActionLoadingState());
    var data = await WishlistRepo.addToWishlist(productId);
    if (data != null) {
      var products = data.data?.products ?? [];
      SharedPref.cacheWishlistIds(products);
      emit(WishlistActionSuccessState(msg: 'Added To Wishlist'));
    } else {
      emit(WishlistActionErrorState());
    }
  }

  Future<void> removeFromWishlist(int productId) async {
    emit(WishlistActionLoadingState());
    var data = await WishlistRepo.removeFromWishlist(productId);
    if (data != null) {
      var products = data.data?.products ?? [];
      SharedPref.cacheWishlistIds(products);
      emit(WishlistActionSuccessState(msg: 'Removed From Wishlist'));
    } else {
      emit(WishlistActionErrorState());
    }
  }

  bool isProductInWishlist(int productId) {
    var wishlistIds = SharedPref.getWishlistIds();
    return wishlistIds.contains(productId);
  }
}
