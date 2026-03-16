import '../../../../core/srevices/dio/apis.dart';
import '../../../../core/srevices/dio/dio_provider.dart';
import '../models/best_seller_books_response/best_seller_books_response.dart';
import '../models/slider_response/slider_response.dart';

class HomeRepo {
  static Future<SliderResponse?> getSliders() async {
    try {
      var response = await DioProvider.get(endpoint: Apis.sliders);
      if (response.statusCode == 200) {
        return SliderResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<BestSellerBooksResponse?> getBestSeller() async {
    try {
      var response = await DioProvider.get(endpoint: Apis.productsBestseller);
      if (response.statusCode == 200) {
        return BestSellerBooksResponse.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
