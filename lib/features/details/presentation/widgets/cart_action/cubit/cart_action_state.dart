class CartActionState {}

class CartActionInitial extends CartActionState {}

class CartActionLoadingState extends CartActionState {}

class CartActionSuccessState extends CartActionState {
  final String msg;

  CartActionSuccessState({required this.msg});
}

class CartActionErrorState extends CartActionState {
  final String message;
  CartActionErrorState({required this.message});
}
