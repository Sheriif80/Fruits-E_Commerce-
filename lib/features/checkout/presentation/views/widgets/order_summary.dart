import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/utils/app_styles.dart';
import 'package:fruits_e_commerce_app/core/utils/theme_extension.dart';
import 'package:fruits_e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/payment_item.dart';
import 'package:fruits_e_commerce_app/generated/l10n.dart';
import 'package:provider/provider.dart';

class OrderSummary extends StatelessWidget {
  const OrderSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return PaymentItem(
      tile: s.orderSummary,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                s.subtotal,
                style: Appstyles.regular13.copyWith(
                  color: context.isDarkMode
                      ? Colors.white
                      : const Color(0xFF4E5556),
                ),
              ),
              const Spacer(),
              Text(
                s.priceTotal(
                  context.read<OrderInputEntity>().cartEntity.calculateTotalPrice(),
                ),
                style: Appstyles.semiBold16,
              ),
            ],
          ),
          Row(
            children: [
              Text(
                s.delivery,
                style: Appstyles.regular13.copyWith(
                  color: context.isDarkMode
                      ? Colors.white
                      : const Color(0xFF4E5556),
                ),
              ),
              const Spacer(),
              Text(
                context.read<OrderInputEntity>().payWithCash
                    ? s.deliveryFee('40')
                    : s.free,
                style: Appstyles.regular16.copyWith(
                  color: context.read<OrderInputEntity>().payWithCard
                      ? Colors.green
                      : null,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          const Divider(height: 20, thickness: 0.5),
          Row(
            children: [
              Text(
                s.total,
                style: Appstyles.bold16.copyWith(
                  color: context.isDarkMode
                      ? Colors.white
                      : const Color(0xFF4E5556),
                ),
              ),
              const Spacer(),
              Text(
                context.read<OrderInputEntity>().payWithCash
                    ? s.priceTotal(
                        context.read<OrderInputEntity>().cartEntity.calculateTotalPrice() + 40,
                      )
                    : s.priceTotal(
                        context.read<OrderInputEntity>().cartEntity.calculateTotalPrice(),
                      ),
                style: Appstyles.bold16,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
