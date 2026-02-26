import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/payment_item.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return PaymentItem(
      tile: "ملخص الطلب",
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'المجموع الفرعي :',
                style: Appstyles.regular13.copyWith(
                  color: const Color(0xFF4E5556),
                ),
              ),
              const Spacer(),
              const Text("150 جنيه ", style: Appstyles.semiBold16),
            ],
          ),
          Row(
            children: [
              Text(
                "ألتوصيل :",
                style: Appstyles.regular13.copyWith(
                  color: const Color(0xFF4E5556),
                ),
              ),
              const Spacer(),
              const Text(
                "30 جنيه ",
                style: Appstyles.regular16,
                textAlign: .start,
              ),
            ],
          ),
          const Divider(height: 20, thickness: 0.5),
          Row(
            children: [
              Text(
                "المجموع الكلي :",
                style: Appstyles.bold16.copyWith(
                  color: const Color(0xFF4E5556),
                ),
              ),
              const Spacer(),
              const Text(
                "180 جنيه ",
                style: Appstyles.bold16,
                textAlign: .start,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
