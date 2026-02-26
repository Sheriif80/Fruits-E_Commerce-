import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/payment_item.dart';
import 'package:gap/gap.dart';

class AddressSummary extends StatelessWidget {
  const AddressSummary({super.key});

  @override
  Widget build(BuildContext context) {
    // Used the payment item widget bcs it has the same structure
    return PaymentItem(
      tile: "عنوان التوصيل",
      child: Row(
        children: [
          const Icon(Icons.location_on_rounded),
          const Gap(4),
          Text(
            'شارع النيل، مبنى رقم ١٢٣',
            style: Appstyles.regular16.copyWith(color: const Color(0xFF4E5556)),
          ),
          const Spacer(),
          Row(
            children: [
              const Icon(Icons.edit, size: 17),
              const Gap(5),
              Text(
                "تعديل",
                style: Appstyles.semiBold13.copyWith(color: Color(0xFF949D9E)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
