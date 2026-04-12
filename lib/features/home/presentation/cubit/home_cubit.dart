import 'package:bookia/features/home/data/models/best_seller_books_response/product.dart';
import 'package:bookia/features/home/data/models/slider_response/slider.dart';
import '../../domain/usecases/home_use_cases.dart';
import 'home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetSlidersUseCase getSlidersUseCase;
  final GetBestSellerUseCase getBestSellerUseCase;

  HomeCubit({
    required this.getSlidersUseCase,
    required this.getBestSellerUseCase,
  }) : super(HomeInitialState());

  List<Slider> sliders = [];
  List<Product> products = [];

  int yourActiveIndex = 0;

  Future<void> initLoadData() async {
    emit(HomeLoadingState());
    await Future.wait([
      getSliders(),
      getBestSeller(),
    ]);
  }

  Future<void> getSliders() async {
    var response = await getSlidersUseCase();
    response.fold(
      (l) => emit(HomeErrorState(message: l.message)),
      (r) {
        sliders = r.data?.sliders ?? [];
        emit(HomeSuccessState());
      },
    );
  }

  Future<void> getBestSeller() async {
    var response = await getBestSellerUseCase();
    response.fold(
      (l) => emit(HomeErrorState(message: l.message)),
      (r) {
        products = r.data?.products ?? [];
        emit(HomeSuccessState());
      },
    );
  }

  void onChangeSlider(int index) {
    yourActiveIndex = index;
    emit(HomeSuccessState());
  }
}
