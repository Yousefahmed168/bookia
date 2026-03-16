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
    var responses = await Future.value([
      await HomeRepo.getSliders(),
      await HomeRepo.getBestSeller(),
    ]);

    var slidersResponse = responses[0] as SliderResponse?;
    var bestSellerResponse = responses[1] as BestSellerBooksResponse?;

    if (slidersResponse != null || bestSellerResponse != null) {
      sliders = slidersResponse?.data?.sliders ?? [];
      products = bestSellerResponse?.data?.products ?? [];
      emit(HomeSuccessState());
    } else {
      emit(HomeErrorState());
    }
  }
}
