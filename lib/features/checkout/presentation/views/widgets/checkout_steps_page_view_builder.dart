import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/checkout_steps.dart';

class CheckoutStepsPageViewBuilder extends StatelessWidget {
  const CheckoutStepsPageViewBuilder({super.key, required this.pageController});

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: pageController,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: getSteps().length,
      itemBuilder: (context, index) => SizedBox(),
    );
  }
}
