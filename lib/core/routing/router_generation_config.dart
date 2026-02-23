import 'package:fruits_e_commerce_app/core/routing/app_routes.dart';
import 'package:fruits_e_commerce_app/features/auth/presentations/views/login_view.dart';
import 'package:fruits_e_commerce_app/features/auth/presentations/views/signup_view.dart';
import 'package:fruits_e_commerce_app/features/best_seller/presentations/views/best_seller_view.dart';
import 'package:fruits_e_commerce_app/features/home/presentations/views/main_view.dart';
import 'package:fruits_e_commerce_app/features/on_boarding/presentaions/views/on_boarding_view.dart';
import 'package:fruits_e_commerce_app/features/splash/presentations/views/splash_view.dart';
import 'package:go_router/go_router.dart';

class RouterGenerationConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.splashView,
    routes: [
      GoRoute(
        path: AppRoutes.splashView,
        name: AppRoutes.splashView,

        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: AppRoutes.onBoardingView,
        name: AppRoutes.onBoardingView,

        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(
        path: AppRoutes.loginView,
        name: AppRoutes.loginView,

        builder: (context, state) => const LoginView(),
      ),
      GoRoute(
        path: AppRoutes.singupView,
        name: AppRoutes.singupView,

        builder: (context, state) => const SignupView(),
      ),
      GoRoute(
        path: AppRoutes.homeView,
        name: AppRoutes.homeView,

        builder: (context, state) => const MainView(),
      ),
      GoRoute(
        path: AppRoutes.bestSellerView,
        name: AppRoutes.bestSellerView,

        builder: (context, state) => const BestSellerView(),
      ),
    ],
  );
}
