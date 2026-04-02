import 'package:bookia/features/contact_us/presentation/cubit/contact_us_cubit.dart';
import 'package:bookia/features/contact_us/presentation/page/contact_us_screen.dart';
import 'package:bookia/features/faq/presentation/cubit/faq_cubit.dart';
import 'package:bookia/features/faq/presentation/page/faq_screen.dart';
import 'package:bookia/features/orders/my_orders/presentation/cubit/my_order_cubit.dart';
import 'package:bookia/features/orders/my_orders/presentation/screens/my_orders_screen.dart';
import 'package:bookia/features/orders/order_details/presentation/cubit/order_details_cubit.dart';
import 'package:bookia/features/orders/order_details/presentation/screens/order_details_screen.dart';
import 'package:bookia/features/profile/reset_password/presentation/cubit/reset_password_cubit.dart';
import 'package:bookia/features/profile/reset_password/presentation/screens/reset_password_screen.dart';

import 'routes.dart';
import '../../features/auth/presentation/page/forgot_password.dart';
import '../../features/auth/presentation/page/login_screen.dart';
import '../../features/auth/presentation/page/new_password_screen.dart';
import '../../features/auth/presentation/page/otp_verfication_screen.dart';
import '../../features/auth/presentation/page/password_changed.dart';
import '../../features/auth/presentation/page/register_screen.dart';
import '../../features/details/presentation/pages/details_screen.dart';
import '../../features/home/data/models/best_seller_books_response/product.dart';
import '../../features/home/presentation/pages/home_screen.dart';
import '../../features/intro/welcome_screen.dart';
import '../../features/main/main_app_screen.dart';
import '../../features/place_order/presentation/page/congrats.dart';
import '../../features/splash/splash_screen.dart';
import '../../features/place_order/presentation/page/place_order_screen.dart';
import '../../features/profile/edit_profile/cubit/edit_profile_cubit.dart';
import '../../features/profile/edit_profile/page/edit_profile_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static var routes = GoRouter(
    navigatorKey: globalContext,
    initialLocation: '/splashscreen',
    routes: [
      GoRoute(
        path: Routes.splashscreen,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: Routes.welcomescreen,
        builder: (context, state) => WelcomeScreen(),
      ),
      GoRoute(
        path: Routes.loginscreen,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: Routes.registerscreen,
        builder: (context, state) => RegisterScreen(),
      ),
      GoRoute(
        path: Routes.homescreen,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: Routes.mainappscreen,
        builder: (context, state) {
          var selectedIndex = state.extra as int?;
          return MainAppScreen(selectedIndex: selectedIndex);
        },
      ),
      GoRoute(
        path: Routes.createnewpassword,
        builder: (context, state) => CreateNewPasswordScreen(),
      ),
      GoRoute(
        path: Routes.otpverfication,
        builder: (context, state) => OtpVerficationScreen(),
      ),
      GoRoute(
        path: Routes.passwordchanged,
        builder: (context, state) => PasswordChanged(),
      ),
      GoRoute(
        path: Routes.forgetpassword,
        builder: (context, state) => ForgetPasswordScreen(),
      ),
      GoRoute(
        path: Routes.details,
        builder: (context, state) {
          return DetailsScreen(model: state.extra as Product);
        },
      ),
      GoRoute(
        path: Routes.placeorder,
        builder: (context, state) =>
            PlaceOrderScreen(total: state.extra as String?),
      ),
      GoRoute(
        path: Routes.orderSuccess,
        builder: (context, state) => const OrderScreen(),
      ),
      GoRoute(
        path: Routes.editProfile,
        builder: (context, state) {
          return BlocProvider(
            create: (context) {
              var cubit = EditProfileCubit();
              cubit.loadInitData();
              return cubit;
            },
            child: EditProfileScreen(),
          );
        },
      ),
      GoRoute(
        path: Routes.myOrders,
        builder: (context, state) => BlocProvider(
          create: (context) => MyOrderCubit(),
          child: const MyOrdersScreen(),
        ),
      ),
      GoRoute(
        path: Routes.orderDetails,
        builder: (context, state) {
          final orderId = state.extra as int;

          return BlocProvider(
            create: (context) => OrderDetailsCubit()..getOrderDetails(orderId),
            child: OrderDetailsScreen(orderId: orderId),
          );
        },
      ),
      GoRoute(
        path: Routes.resetPassword,
        builder: (context, state) => BlocProvider(
          create: (context) => ResetPasswordCubit(),
          child: const ResetPasswordScreen(),
        ),
      ),
      GoRoute(
        path: Routes.faq,
        builder: (context, state) => BlocProvider(
          create: (context) => FaqCubit(),
          child: const FaqScreen(),
        ),
      ),
      GoRoute(
        path: Routes.contactUs,
        builder: (context, state) => BlocProvider(
          create: (context) => ContactUsCubit(),
          child: const ContactUsScreen(),
        ),
      ),
    ],
  );
}
