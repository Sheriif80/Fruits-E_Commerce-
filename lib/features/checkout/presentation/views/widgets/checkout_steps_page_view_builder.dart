import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/address_input_section.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/payment_section.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/shipping_section.dart';

class CheckoutStepsPageViewBuilder extends StatelessWidget {
  const CheckoutStepsPageViewBuilder({
    super.key,
    required this.pageController,
    required this.formKey,
  });

  final PageController pageController;
  final GlobalKey<FormState> formKey;

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

  List<Widget> getPages() => [
    const ShippingSection(),
    AddressInputSection(formKey: formKey),
    PaymentSection(pageController: pageController),
  ];
}
