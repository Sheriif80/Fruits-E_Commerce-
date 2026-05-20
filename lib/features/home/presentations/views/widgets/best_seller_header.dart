import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/routing/app_routes.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:fruits_e_commerce_app/generated/l10n.dart';
import 'package:go_router/go_router.dart';

class BestSellerHeader extends StatelessWidget {
  const BestSellerHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            GoRouter.of(context).pushNamed(AppRoutes.bestSellerView);
          },
          child: Text(
            s.bestSeller,
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
            s.more,
            textAlign: TextAlign.center,
            style: Appstyles.regular13.copyWith(color: const Color(0xFF949D9E)),
          ),
        ),
      ],
    );
  }
}
