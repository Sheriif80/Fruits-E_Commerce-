import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({
    super.key,
    required this.currentStep,
    required this.pageController,
  });
  final int currentStep;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps().length, (index) {
        return Expanded(
          child: GestureDetector(
            onTap: () {
              if (index < currentStep) {
                pageController.animateToPage(
                  index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              }
            },
            child: StepItem(
              title: getSteps()[index],
              index: index + 1,
              isActive: index < currentStep,
            ),
          ),
        );
      }),
    );
  }
}

List<String> getSteps() => ["الشحن", "العنوان", "الدفع"];
