import 'package:bookia/features/home/data/models/best_seller_books_response/product.dart';
import '../../domain/usecases/wishlist_use_cases.dart';
import 'wishlist_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistCubit extends Cubit<WishlistState> {
  final GetWishlistUseCase getWishlistUseCase;
  final RemoveFromWishlistUseCase removeFromWishlistUseCase;

  WishlistCubit({
    required this.getWishlistUseCase,
    required this.removeFromWishlistUseCase,
  }) : super(WishlistInitial());

  List<Product> products = [];

  Future<void> getWishlist() async {
    emit(WishlistLoadingState());
    var response = await getWishlistUseCase();

    response.fold(
      (l) => emit(WishlistErrorState(message: l.message)),
      (r) {
        products = r.products ?? [];
        emit(WishlistSuccessState());
      },
    );
  }

  Future<void> removeFromWishlist(int productId) async {
    emit(WishlistLoadingState());
    var response = await removeFromWishlistUseCase(productId);

    response.fold(
      (l) => emit(WishlistErrorState(message: l.message)),
      (r) {
        products = r.products ?? [];
        emit(WishlistSuccessState());
      },
    );
  }
}
