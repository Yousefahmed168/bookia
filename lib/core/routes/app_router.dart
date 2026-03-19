import 'package:bookia/core/routes/routes.dart';
import 'package:bookia/features/auth/presentation/page/forgot_password.dart';
import 'package:bookia/features/auth/presentation/page/login_screen.dart';
import 'package:bookia/features/auth/presentation/page/new_password_screen.dart';
import 'package:bookia/features/auth/presentation/page/otp_verfication_screen.dart';
import 'package:bookia/features/auth/presentation/page/password_changed.dart';
import 'package:bookia/features/auth/presentation/page/register_screen.dart';
import 'package:bookia/features/details/presentation/pages/details_screen.dart';
import 'package:bookia/features/home/data/models/best_seller_books_response/product.dart';
import 'package:bookia/features/home/presentation/pages/home_screen.dart';
import 'package:bookia/features/intro/welcome_screen.dart';
import 'package:bookia/features/main/main_app_screen.dart';
import 'package:bookia/features/splash/splash_screen.dart';
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
        builder: (context, state) => MainAppScreen(),
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
    ],
  );
}
