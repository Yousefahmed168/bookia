class PlaceOrderState {}

class PlaceOrderInitial extends PlaceOrderState {}

class GovernoratesLoadingState extends PlaceOrderState {}

class GovernoratesSuccessState extends PlaceOrderState {}

class GovernoratesErrorState extends PlaceOrderState {
  final String message;
  GovernoratesErrorState({required this.message});
}

class PlaceOrderLoading extends PlaceOrderState {}

class PlaceOrderSuccess extends PlaceOrderState {}

class PlaceOrderError extends PlaceOrderState {
  final String message;
  PlaceOrderError(this.message);
}
