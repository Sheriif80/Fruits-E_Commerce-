import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/routing/app_routes.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:go_router/go_router.dart';

class BestSellerHeader extends StatelessWidget {
  const BestSellerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pushNamed(AppRoutes.bestSellerView);
          },
          child: const Text(
            'الأكثر مبيعًا',
            textAlign: TextAlign.right,
            style: Appstyles.regular16,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pushNamed(AppRoutes.bestSellerView);
          },
          child: Text(
            'المزيد...',
            textAlign: TextAlign.center,
            style: Appstyles.regular13.copyWith(color: const Color(0xFF949D9E)),
          ),
        ),
      ],
    );
  }
}
