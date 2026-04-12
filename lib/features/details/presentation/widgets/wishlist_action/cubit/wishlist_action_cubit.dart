import '../../../../../../core/services/local/shared_pref.dart';
import '../../../../../wishlist/domain/usecases/wishlist_use_cases.dart';
import 'wishlist_icon_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistActionCubit extends Cubit<WishlistActionState> {
  final AddToWishlistUseCase addToWishlistUseCase;
  final RemoveFromWishlistUseCase removeFromWishlistUseCase;

  WishlistActionCubit({
    required this.addToWishlistUseCase,
    required this.removeFromWishlistUseCase,
  }) : super(WishlistActionInitial());

  Future<void> addToWishlist(int productId) async {
    emit(WishlistActionLoadingState());
    var response = await addToWishlistUseCase(productId);

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
    var response = await removeFromWishlistUseCase(productId);

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
