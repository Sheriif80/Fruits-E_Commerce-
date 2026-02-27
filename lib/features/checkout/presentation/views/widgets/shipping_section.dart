import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/shipping_item.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(22),
        ShippingItem(
          title: 'الدفع عند الاستلام',
          subtitle: 'السعر يشمل مصاريف الشحن',
          price:
              '${context.read<OrderEntity>().cartEntity.calculateTotalPrice() + 40} جنيه',
          isActive: selectedIndex == 0,
          onTap: () {
            setState(() {
              selectedIndex = 0;
            });
          },
        ),
        const Gap(16),
        ShippingItem(
          title: 'الدفع باستخدام البطاقة البنكية',
          subtitle: 'الشحن مجاني',
          price:
              "${context.read<OrderEntity>().cartEntity.calculateTotalPrice()} جنيه",
          isActive: selectedIndex == 1,
          onTap: () {
            setState(() {
              selectedIndex = 1;
            });
          },
        ),
      ],
    );
  }
}
