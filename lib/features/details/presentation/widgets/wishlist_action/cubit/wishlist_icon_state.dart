class WishlistActionState {}

class WishlistActionInitial extends WishlistActionState {}

class WishlistActionLoadingState extends WishlistActionState {}

class WishlistActionSuccessState extends WishlistActionState {
  final String msg;

  WishlistActionSuccessState({required this.msg});
}

class WishlistActionErrorState extends WishlistActionState {
  final String message;
  WishlistActionErrorState({required this.message});
}
