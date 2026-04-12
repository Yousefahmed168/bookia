import 'package:bookia/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:bookia/features/auth/data/data_sources/auth_remote_data_source_impl.dart';
import 'package:bookia/features/auth/data/repo/auth_repo_impl.dart';
import 'package:bookia/features/auth/domain/repo/auth_repo.dart';
import 'package:bookia/features/auth/domain/usecases/forget_password_use_case.dart';
import 'package:bookia/features/auth/domain/usecases/login_use_case.dart';
import 'package:bookia/features/auth/domain/usecases/otp_code_use_case.dart';
import 'package:bookia/features/auth/domain/usecases/register_use_case.dart';
import 'package:bookia/features/auth/domain/usecases/reset_password_use_case.dart';
import 'package:bookia/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia/features/cart/data/data_sources/cart_remote_data_source.dart';
import 'package:bookia/features/cart/data/data_sources/cart_remote_data_source_impl.dart';
import 'package:bookia/features/cart/data/repo/cart_repo_impl.dart';
import 'package:bookia/features/cart/domain/repo/cart_repo.dart';
import 'package:bookia/features/cart/domain/usecases/add_to_cart_use_case.dart';
import 'package:bookia/features/cart/domain/usecases/checkout_use_case.dart';
import 'package:bookia/features/cart/domain/usecases/get_cart_use_case.dart';
import 'package:bookia/features/cart/domain/usecases/remove_from_cart_use_case.dart';
import 'package:bookia/features/cart/domain/usecases/update_cart_use_case.dart';
import 'package:bookia/features/cart/presentation/cubit/cart_cubit.dart';
import 'package:bookia/features/contact_us/data/data_sources/contact_us_remote_data_source.dart';
import 'package:bookia/features/contact_us/data/data_sources/contact_us_remote_data_source_impl.dart';
import 'package:bookia/features/contact_us/data/repo/contact_us_repo_impl.dart';
import 'package:bookia/features/contact_us/domain/repo/contact_us_repo.dart';
import 'package:bookia/features/contact_us/domain/usecases/send_message_use_case.dart';
import 'package:bookia/features/contact_us/presentation/cubit/contact_us_cubit.dart';
import 'package:bookia/features/details/presentation/widgets/cart_action/cubit/cart_action_cubit.dart';
import 'package:bookia/features/faq/data/data_sources/faq_remote_data_source.dart';
import 'package:bookia/features/faq/data/data_sources/faq_remote_data_source_impl.dart';
import 'package:bookia/features/faq/data/repo/faq_repo_impl.dart';
import 'package:bookia/features/faq/domain/repo/faq_repo.dart';
import 'package:bookia/features/faq/domain/usecases/get_faqs_use_case.dart';
import 'package:bookia/features/faq/presentation/cubit/faq_cubit.dart';
import 'package:bookia/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookia/features/home/data/data_sources/home_remote_data_source_impl.dart';
import 'package:bookia/features/home/data/repo/home_repo_impl.dart';
import 'package:bookia/features/home/domain/repo/home_repo.dart';
import 'package:bookia/features/home/domain/usecases/home_use_cases.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/wishlist/data/data_sources/wishlist_remote_data_source.dart';
import 'package:bookia/features/wishlist/data/data_sources/wishlist_remote_data_source_impl.dart';
import 'package:bookia/features/wishlist/data/repo/wishlist_repo_impl.dart';
import 'package:bookia/features/wishlist/domain/repo/wishlist_repo.dart';
import 'package:bookia/features/wishlist/domain/usecases/wishlist_use_cases.dart';
import 'package:bookia/features/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:bookia/features/details/presentation/widgets/wishlist_action/cubit/wishlist_action_cubit.dart';
import 'package:bookia/features/profile/edit_profile/data/data_sources/profile_remote_data_source.dart';
import 'package:bookia/features/profile/edit_profile/data/data_sources/profile_remote_data_source_impl.dart';
import 'package:bookia/features/profile/edit_profile/data/repo/profile_repo_impl.dart';
import 'package:bookia/features/profile/edit_profile/domain/repo/profile_repo.dart';
import 'package:bookia/features/profile/edit_profile/domain/usecases/profile_use_cases.dart';
import 'package:bookia/features/profile/edit_profile/cubit/edit_profile_cubit.dart';
import 'package:bookia/features/profile/reset_password/data/data_sources/reset_password_remote_data_source.dart';
import 'package:bookia/features/profile/reset_password/data/data_sources/reset_password_remote_data_source_impl.dart';
import 'package:bookia/features/profile/reset_password/data/repo/reset_password_repo_impl.dart';
import 'package:bookia/features/profile/reset_password/domain/repo/reset_password_repo.dart';
import 'package:bookia/features/profile/reset_password/domain/usecases/reset_password_use_case.dart';
import 'package:bookia/features/profile/reset_password/presentation/cubit/reset_password_cubit.dart';
import 'package:bookia/features/orders/my_orders/data/data_sources/my_orders_remote_data_source.dart';
import 'package:bookia/features/orders/my_orders/data/data_sources/my_orders_remote_data_source_impl.dart';
import 'package:bookia/features/orders/my_orders/data/repo/my_orders_repo_impl.dart';
import 'package:bookia/features/orders/my_orders/domain/repo/my_orders_repo.dart';
import 'package:bookia/features/orders/my_orders/domain/usecases/get_orders_use_case.dart';
import 'package:bookia/features/orders/my_orders/presentation/cubit/my_order_cubit.dart';
import 'package:bookia/features/orders/order_details/data/data_sources/order_details_remote_data_source.dart';
import 'package:bookia/features/orders/order_details/data/data_sources/order_details_remote_data_source_impl.dart';
import 'package:bookia/features/orders/order_details/data/repo/order_details_repo_impl.dart';
import 'package:bookia/features/orders/order_details/domain/repo/order_details_repo.dart';
import 'package:bookia/features/orders/order_details/domain/usecases/get_order_details_use_case.dart';
import 'package:bookia/features/orders/order_details/presentation/cubit/order_details_cubit.dart';
import 'package:bookia/features/place_order/data/data_sources/place_order_remote_data_source.dart';
import 'package:bookia/features/place_order/data/data_sources/place_order_remote_data_source_impl.dart';
import 'package:bookia/features/place_order/data/repo/place_order_repo_impl.dart';
import 'package:bookia/features/place_order/domain/repo/place_order_repo.dart';
import 'package:bookia/features/place_order/domain/usecases/place_order_use_cases.dart';
import 'package:bookia/features/place_order/presentation/cubit/place_order_cubit.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;
void setupServiceLocator() {
  // Data sources
  getIt.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<ContactUsRemoteDataSource>(
    () => ContactUsRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<FaqRemoteDataSource>(
    () => FaqRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<WishlistRemoteDataSource>(
    () => WishlistRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<HomeRemoteDataSource>(
    () => HomeRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<ResetPasswordRemoteDataSource>(
    () => ResetPasswordRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<MyOrdersRemoteDataSource>(
    () => MyOrdersRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<OrderDetailsRemoteDataSource>(
    () => OrderDetailsRemoteDataSourceImpl(),
  );
  getIt.registerLazySingleton<PlaceOrderRemoteDataSource>(
    () => PlaceOrderRemoteDataSourceImpl(),
  );

  // Repository
  getIt.registerLazySingleton<AuthRepo>(() => AuthRepoImpl(getIt()));
  getIt.registerLazySingleton<CartRepo>(() => CartRepoImpl(getIt()));
  getIt.registerLazySingleton<ContactUsRepo>(() => ContactUsRepoImpl(getIt()));
  getIt.registerLazySingleton<FaqRepo>(() => FaqRepoImpl(getIt()));
  getIt.registerLazySingleton<WishlistRepo>(() => WishlistRepoImpl(getIt()));
  getIt.registerLazySingleton<HomeRepo>(() => HomeRepoImpl(getIt()));
  getIt.registerLazySingleton<ProfileRepo>(() => ProfileRepoImpl(getIt()));
  getIt.registerLazySingleton<ResetProfilePasswordRepo>(
    () => ResetProfilePasswordRepoImpl(getIt()),
  );
  getIt.registerLazySingleton<MyOrdersRepo>(() => MyOrdersRepoImpl(getIt()));
  getIt.registerLazySingleton<OrderDetailsRepo>(
    () => OrderDetailsRepoImpl(getIt()),
  );
  getIt.registerLazySingleton<PlaceOrderRepo>(() => PlaceOrderRepoImpl(getIt()));

  // Use cases
  getIt.registerLazySingleton(() => LoginUseCase(getIt()));
  getIt.registerLazySingleton(() => RegisterUseCase(getIt()));
  getIt.registerLazySingleton(() => ForgetPasswordUseCase(getIt()));
  getIt.registerLazySingleton(() => OtpcodeUseCase(getIt()));
  getIt.registerLazySingleton(() => ResetPasswordUseCase(getIt()));

  getIt.registerLazySingleton(() => GetCartUseCase(getIt()));
  getIt.registerLazySingleton(() => AddToCartUseCase(getIt()));
  getIt.registerLazySingleton(() => RemoveFromCartUseCase(getIt()));
  getIt.registerLazySingleton(() => UpdateCartUseCase(getIt()));
  getIt.registerLazySingleton(() => CheckoutUseCase(getIt()));

  getIt.registerLazySingleton(() => SendMessageUseCase(getIt()));
  getIt.registerLazySingleton(() => GetFaqsUseCase(getIt()));

  getIt.registerLazySingleton(() => GetWishlistUseCase(getIt()));
  getIt.registerLazySingleton(() => AddToWishlistUseCase(getIt()));
  getIt.registerLazySingleton(() => RemoveFromWishlistUseCase(getIt()));

  getIt.registerLazySingleton(() => GetSlidersUseCase(getIt()));
  getIt.registerLazySingleton(() => GetBestSellerUseCase(getIt()));

  getIt.registerLazySingleton(() => EditProfileUseCase(getIt()));
  getIt.registerLazySingleton(() => LogoutUseCase(getIt()));
  getIt.registerLazySingleton(() => ResetProfilePasswordUseCase(getIt()));

  getIt.registerLazySingleton(() => GetOrdersUseCase(getIt()));
  getIt.registerLazySingleton(() => GetOrderDetailsUseCase(getIt()));

  getIt.registerLazySingleton(() => GetGovernoratesUseCase(getIt()));
  getIt.registerLazySingleton(() => PlaceOrderUseCase(getIt()));

  // Cubit
  getIt.registerFactory(
    () => AuthCubit(
      loginUseCase: getIt(),
      registerUseCase: getIt(),
      forgetPasswordUseCase: getIt(),
      otpcodeUseCase: getIt(),
      resetPasswordUseCase: getIt(),
    ),
  );
  getIt.registerFactory(
    () => CartCubit(
      getCartUseCase: getIt(),
      removeFromCartUseCase: getIt(),
      updateCartUseCase: getIt(),
      checkoutUseCase: getIt(),
    ),
  );
  getIt.registerFactory(
    () => CartActionCubit(
      addToCartUseCase: getIt(),
      removeFromCartUseCase: getIt(),
    ),
  );
  getIt.registerFactory(
    () => WishlistActionCubit(
      addToWishlistUseCase: getIt(),
      removeFromWishlistUseCase: getIt(),
    ),
  );
  getIt.registerFactory(() => ContactUsCubit(getIt()));
  getIt.registerFactory(() => FaqCubit(getIt()));
  getIt.registerFactory(() => WishlistCubit(
        getWishlistUseCase: getIt(),
        removeFromWishlistUseCase: getIt(),
      ));
  getIt.registerFactory(
    () => HomeCubit(
      getSlidersUseCase: getIt(),
      getBestSellerUseCase: getIt(),
    ),
  );
  getIt.registerFactory(
    () => EditProfileCubit(
      editProfileUseCase: getIt(),
      logoutUseCase: getIt(),
    ),
  );
  getIt.registerFactory(
    () => ResetPasswordCubit(getIt()),
  );
  getIt.registerFactory(() => MyOrderCubit(getIt()));
  getIt.registerFactory(() => OrderDetailsCubit(getIt()));
  getIt.registerFactory(
    () => PlaceOrderCubit(
      getGovernoratesUseCase: getIt(),
      placeOrderUseCase: getIt(),
    ),
  );
}
