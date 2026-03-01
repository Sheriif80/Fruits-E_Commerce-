import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:fruits_e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/payment_item.dart';
import 'package:provider/provider.dart';

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
              Text(
                "${context.read<OrderEntity>().cartEntity.calculateTotalPrice()} جنيه ",
                style: Appstyles.semiBold16,
              ),
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
                "40 جنيه ",
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
              Text(
                "${context.read<OrderEntity>().cartEntity.calculateTotalPrice() + 40} جنيه ",
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
