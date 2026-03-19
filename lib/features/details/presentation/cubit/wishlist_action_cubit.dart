import 'package:bookia/core/services/local/shared_pref.dart';
import 'package:bookia/features/details/presentation/cubit/wishlist_icon_state.dart';
import 'package:bookia/features/wishlist/data/repo/wishlist_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistActionCubit extends Cubit<DetailsState> {
  WishlistActionCubit() : super(DetailsInitial());

  Future<void> addToWishlist(int productId) async {
    emit(DetailsLoadingState());
    var data = await WishlistRepo.addToWishlist(productId);
    if (data != null) {
      var products = data.data?.products ?? [];
      SharedPref.cacheWishlistIds(products);
      emit(DetailsSuccessState(msg: 'Added To Wishlist'));
    } else {
      emit(DetailsErrorState());
    }
  }

  Future<void> removeFromWishlist(int productId) async {
    emit(DetailsLoadingState());
    var data = await WishlistRepo.removeFromWishlist(productId);
    if (data != null) {
      var products = data.data?.products ?? [];
      SharedPref.cacheWishlistIds(products);
      emit(DetailsSuccessState(msg: 'Removed From Wishlist'));
    } else {
      emit(DetailsErrorState());
    }
  }

  bool isProductInWishlist(int productId) {
    var wishlistIds = SharedPref.getWishlistIds();
    return wishlistIds.contains(productId);
  }
}
