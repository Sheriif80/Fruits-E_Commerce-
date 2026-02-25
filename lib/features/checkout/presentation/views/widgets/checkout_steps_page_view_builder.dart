import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/shipping_section.dart';

class CheckoutStepsPageViewBuilder extends StatelessWidget {
  const CheckoutStepsPageViewBuilder({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: getPages().length,
        itemBuilder: (context, index) => getPages()[index],
      ),
    );
  }
}

List<Widget> getPages() => [
  const ShippingSection(),
  const SizedBox(),
  const SizedBox(),
  const SizedBox(),
];
