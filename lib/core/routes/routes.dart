import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/page/forgot_password.dart';
import '../../features/auth/presentation/page/login_screen.dart.dart';
import '../../features/auth/presentation/page/new_password_screen.dart';
import '../../features/auth/presentation/page/otp_verfication_screen.dart';
import '../../features/auth/presentation/page/password_changed.dart';
import '../../features/auth/presentation/page/register_screen.dart';
import '../../features/details/presentation/pages/details_screen.dart';
import '../../features/home/data/models/best_seller_books_response/product.dart';
import '../../features/home/presentation/pages/home_screen.dart';
import '../../features/intro/welcome_screen.dart';
import '../../features/main/main_app_screen.dart';
import '../../features/splash/splash_screen.dart';

var globalContext = GlobalKey<NavigatorState>();

class Routes {
  static String splashscreen = '/splashscreen';
  static String welcomescreen = '/welcomescreen';
  static String loginscreen = '/loginscreen';
  static String registerscreen = '/registerscreen';
  static String homescreen = '/homescreen';
  static String mainappscreen = '/mainappscreen';
  static String createnewpassword = '/createnewpassword';
  static String otpverfication = '/otpverfication';
  static String passwordchanged = '/passwordchanged';
  static String forgetpassword = '/passwordchanged';
  static String details = '/details';

  static var routes = GoRouter(
    navigatorKey: globalContext,
    initialLocation: '/splashscreen',
    routes: [
      GoRoute(path: splashscreen, builder: (context, state) => SplashScreen()),
      GoRoute(
        path: welcomescreen,
        builder: (context, state) => WelcomeScreen(),
      ),
      GoRoute(path: loginscreen, builder: (context, state) => LoginScreen()),
      GoRoute(
        path: registerscreen,
        builder: (context, state) => RegisterScreen(),
      ),
      GoRoute(path: homescreen, builder: (context, state) => HomeScreen()),
      GoRoute(
        path: mainappscreen,
        builder: (context, state) => MainAppScreen(),
      ),
      GoRoute(
        path: createnewpassword,
        builder: (context, state) => CreateNewPasswordScreen(),
      ),
      GoRoute(
        path: otpverfication,
        builder: (context, state) => OtpVerficationScreen(),
      ),
      GoRoute(
        path: passwordchanged,
        builder: (context, state) => PasswordChanged(),
      ),
      GoRoute(
        path: forgetpassword,
        builder: (context, state) => ForgetPasswordScreen(),
      ),
      GoRoute(
        path: details,
        builder: (context, state) =>
            DetailsScreen(product: state.extra as Product),
      ),
    ],
  );
}
