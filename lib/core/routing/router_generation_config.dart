import 'package:fruits_e_commerce_app/core/routing/app_routes.dart';
import 'package:fruits_e_commerce_app/features/splash/presentations/view/splash_view.dart';
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
    ],
  );
}
