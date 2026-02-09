import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/constants.dart';
import 'package:fruits_e_commerce_app/core/routing/app_routes.dart';
import 'package:fruits_e_commerce_app/core/services/cahce_helper.dart';
import 'package:fruits_e_commerce_app/features/splash/presentations/views/widgets/splash_view_body.dart';
import 'package:go_router/go_router.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    excuteNavigation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SplashViewBody());
  }

  void excuteNavigation() {
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (CacheHelper.containsKey(key: kIsOnBoardingVisible)) {
        final bool isOnBoardingVisible = CacheHelper.getData(
          key: kIsOnBoardingVisible,
        );
        if (isOnBoardingVisible == true) {
          GoRouter.of(context).go(AppRoutes.loginView);
        } else {
          GoRouter.of(context).go(AppRoutes.onBoardingView);
        }
      } else {
        GoRouter.of(context).go(AppRoutes.onBoardingView);
      }
    });
  }
}
