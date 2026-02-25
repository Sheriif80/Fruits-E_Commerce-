import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/shipping_item.dart';
import 'package:gap/gap.dart';

class ShippingSection extends StatelessWidget {
  const ShippingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(22),
        ShippingItem(
          title: 'الدفع عند الاستلام',
          subtitle: 'التسليم من المكان',
          price: '40 جنيه',
        ),
        Gap(16),
        ShippingItem(
          title: 'الدفع عند البطاقة البنكية',
          subtitle: 'يرجى تحديد طريقة الدفع',
          price: 'مجاني',
        ),
      ],
    );
  }
}
