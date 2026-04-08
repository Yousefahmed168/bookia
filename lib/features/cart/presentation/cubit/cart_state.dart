class CartState {}

class CartInitial extends CartState {}

class CartLoadingState extends CartState {}

class CartSuccessState extends CartState {}

class CartErrorState extends CartState {
  final String message;
  CartErrorState({required this.message});
}

class CheckoutLoadingState extends CartState {}

class CheckoutSuccessState extends CartState {}

class CheckoutErrorState extends CartState {
  final String message;
  CheckoutErrorState({required this.message});
}
