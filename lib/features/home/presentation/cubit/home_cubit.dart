import 'package:bookia/core/services/dio/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/best_seller_books_response/best_seller_books_response.dart';
import '../../data/models/best_seller_books_response/product.dart';
import '../../data/models/slider_response/slider.dart';
import '../../data/models/slider_response/slider_response.dart';
import '../../data/repo/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitialState());

  List<Slider> sliders = [];
  List<Product> products = [];

  Future<void> initLoadData() async {
    emit(HomeLoadingState());

    final results = await Future.wait([
      HomeRepo.getSliders(),
      HomeRepo.getBestSeller(),
    ]);

    final slidersResult = results[0] as Either<Failure, SliderResponse>;
    final bestSellerResult =
        results[1] as Either<Failure, BestSellerBooksResponse>;

    String? errorMessage;

    slidersResult.fold(
      (l) => errorMessage = l.message,
      (r) => sliders = r.data?.sliders ?? [],
    );

    bestSellerResult.fold(
      (l) => errorMessage ??= l.message,
      (r) => products = r.data?.products ?? [],
    );

    if (errorMessage != null && sliders.isEmpty && products.isEmpty) {
      emit(HomeErrorState(message: errorMessage!));
    } else {
      emit(HomeSuccessState());
    }
  }
}
