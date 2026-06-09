import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/shipping_item.dart';
import 'package:fruits_e_commerce_app/generated/l10n.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class ShippingSection extends StatefulWidget {
  const ShippingSection({super.key});

  @override
  State<ShippingSection> createState() => _ShippingSectionState();
}

class _ShippingSectionState extends State<ShippingSection>
    with AutomaticKeepAliveClientMixin {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final s = S.of(context);
    return Column(
      children: [
        const Gap(22),
        ShippingItem(
          title: s.cashOnDelivery,
          subtitle: s.shippingIncluded,
          price: s.price(
            context.read<OrderInputEntity>().cartEntity.calculateTotalPrice() +
                40,
          ),
          isActive: selectedIndex == 0,
          onTap: () {
            setState(() {
              selectedIndex = 0;
            });
            context.read<OrderInputEntity>().payWithCash = true;
            context.read<OrderInputEntity>().payWithCard = false;
            context.read<OrderInputEntity>().payWithStripe = false;
          },
        ),
        const Gap(16),
        ShippingItem(
          title: s.payWithCard,
          subtitle: s.freeShipping,
          price: s.price(
            context.read<OrderInputEntity>().cartEntity.calculateTotalPrice(),
          ),
          isActive: selectedIndex == 1,
          onTap: () {
            setState(() {
              selectedIndex = 1;
            });
            context.read<OrderInputEntity>().payWithCash = false;
            context.read<OrderInputEntity>().payWithCard = true;
            context.read<OrderInputEntity>().payWithStripe = false;
          },
        ),
        const Gap(16),
        ShippingItem(
          title: s.payWithStripe,
          subtitle: s.freeShipping,
          price: s.price(
            context.read<OrderInputEntity>().cartEntity.calculateTotalPrice(),
          ),
          isActive: selectedIndex == 2,
          onTap: () {
            setState(() {
              selectedIndex = 2;
            });
            context.read<OrderInputEntity>().payWithCash = false;
            context.read<OrderInputEntity>().payWithCard = false;
            context.read<OrderInputEntity>().payWithStripe = true;
          },
        ),
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
