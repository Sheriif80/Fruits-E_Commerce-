import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/step_item.dart';

class CheckoutSteps extends StatelessWidget {
  const CheckoutSteps({super.key, required this.currentStep});
  final int currentStep;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(getSteps().length, (index) {
        return Expanded(
          child: StepItem(
            title: getSteps()[index],
            index: index + 1,
            isActive: index < currentStep,
          ),
        );
      }),
    );
  }
}

List<String> getSteps() => ["الشحن", "العنوان", "الدفع"];
