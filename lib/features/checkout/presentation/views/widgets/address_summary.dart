import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:fruits_e_commerce_app/core/utils/theme_extension.dart';
import 'package:fruits_e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/payment_item.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class AddressSummary extends StatelessWidget {
  const AddressSummary({super.key, required this.pageController});
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    // Used the payment item widget bcs it has the same structure
    return PaymentItem(
      tile: "عنوان التوصيل",
      child: Row(
        children: [
          const Icon(Icons.location_on_rounded),
          const Gap(4),
          Expanded(
            child: Text(
              context.read<OrderInputEntity>().shippingAddress!.fullAddress,
              style: Appstyles.regular16.copyWith(
                color: context.isDarkMode
                    ? Colors.white
                    : const Color(0xFF4E5556),
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          const Gap(8),
          GestureDetector(
            onTap: () {
              pageController.animateToPage(
                1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.edit, size: 17),
                const Gap(5),
                Text(
                  "تعديل",
                  style: Appstyles.semiBold13.copyWith(
                    color: const Color(0xFF949D9E),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
