import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/routing/app_routes.dart';
import 'package:fruits_e_commerce_app/core/utils/app_assets.dart';
import 'package:fruits_e_commerce_app/core/utils/app_colors.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_button.dart';
import 'package:fruits_e_commerce_app/generated/l10n.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:svg_flutter/svg.dart';

class OrderCreatedViewBody extends StatelessWidget {
  const OrderCreatedViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Gap(50),
          Center(child: SvgPicture.asset(Assets.imagesOrderCreated)),
          const Gap(33),
          Text(s.orderCreated, style: Appstyles.bold16),
          const Gap(15),
          Text(s.contactMessage, style: Appstyles.bold16),
          const Spacer(),
          CustomButton(
            text: s.trackOrder,
            onPressed: () {
              GoRouter.of(context).pushNamed(AppRoutes.myOrdersView);
            },
          ),
          const Gap(20),
          GestureDetector(
            onTap: () => GoRouter.of(context).pop(),
            child: Text(
              s.home,
              style: Appstyles.bold16.copyWith(color: AppColors.primaryColor),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
