import 'package:fruits_e_commerce_app/core/entities/product_entity.dart';
import 'package:fruits_e_commerce_app/core/routing/app_routes.dart';
import 'package:fruits_e_commerce_app/features/auth/presentations/views/forgot_password_view.dart';
import 'package:fruits_e_commerce_app/features/auth/presentations/views/login_view.dart';
import 'package:fruits_e_commerce_app/features/auth/presentations/views/signup_view.dart';
import 'package:fruits_e_commerce_app/features/best_seller/presentations/views/best_seller_view.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/checkout_view.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/order_created_view.dart';
import 'package:fruits_e_commerce_app/features/cart/domain/entities/cart_entity.dart';
import 'package:fruits_e_commerce_app/features/favorites/presentation/views/favorites_view.dart';
import 'package:fruits_e_commerce_app/features/main/presentation/views/main_view.dart';
import 'package:fruits_e_commerce_app/features/on_boarding/presentaions/views/on_boarding_view.dart';
import 'package:fruits_e_commerce_app/features/products/presentation/views/reviews_view.dart';
import 'package:fruits_e_commerce_app/features/products/presentation/views/widgets/product_details_view.dart';
import 'package:fruits_e_commerce_app/features/profile/presentation/views/my_orders_view.dart';
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
      GoRoute(
        path: AppRoutes.checkoutView,
        name: AppRoutes.checkoutView,

        builder: (context, state) =>
            CheckoutView(cartEntity: state.extra as CartEntity),
      ),
      GoRoute(
        path: AppRoutes.orderCreatedView,
        name: AppRoutes.orderCreatedView,

        builder: (context, state) => const OrderCreatedView(),
      ),
      GoRoute(
        path: AppRoutes.forgotPasswordView,
        name: AppRoutes.forgotPasswordView,

        builder: (context, state) => const ForgotPasswordView(),
      ),
      GoRoute(
        path: AppRoutes.myOrdersView,
        name: AppRoutes.myOrdersView,

        builder: (context, state) => const MyOrdersView(),
      ),
      GoRoute(
        path: AppRoutes.productDetailsView,
        name: AppRoutes.productDetailsView,

        builder: (context, state) =>
            ProductDetailsView(productEntity: state.extra as ProductEntity),
      ),
      GoRoute(
        path: AppRoutes.reviewsView,
        name: AppRoutes.reviewsView,

        builder: (context, state) =>
            ReviewsView(productEntity: state.extra as ProductEntity),
      ),
      GoRoute(
        path: AppRoutes.favoritesView,
        name: AppRoutes.favoritesView,

        builder: (context, state) => const FavoritesView(),
      ),
    ],
  );
}
