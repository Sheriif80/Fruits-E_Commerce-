import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruits_e_commerce_app/constants.dart';
import 'package:fruits_e_commerce_app/core/utils/app_keys.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_button.dart';
import 'package:fruits_e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_e_commerce_app/features/checkout/domain/entities/paypal_payment_entity/paypal_payment_entity.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/cubits/add_order_cubit/add_order_cubit.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/checkout_steps_page_view_builder.dart';
import 'package:gap/gap.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  late PageController pageController;
  int currentPage = 0;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.toInt();
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        children: [
          const Gap(15),
          CheckoutSteps(
            currentStep: currentPage,
            pageController: pageController,
          ),
          Expanded(
            child: CheckoutStepsPageViewBuilder(
              pageController: pageController,
              formKey: _formKey,
            ),
          ),
          CustomButton(
            text: currentPage == 2 ? "الدفع بواسطة PayPal" : "التالي",
            onPressed: () async {
              if (currentPage == 1) {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                } else {
                  return;
                }
              }
              if (currentPage == 2) {
                _processPayment(context);

                ////////////////////////
                /*  await context.read<AddOrderCubit>().addOrder(
                  orderEntity: context.read<OrderEntity>(),
                );
                return;
                */
              }

              pageController.animateToPage(
                currentPage + 1,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
          ),
          const Gap(25),
        ],
      ),
    );
  }

  void _processPayment(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: kPayPalClientID,
          secretKey: kPayPalSecretKey,
          transactions: [
            PaypalPaymentEntity.fromEntity(
              context.read<OrderEntity>(),
            ).toJson(),
          ],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            print("onSuccess: $params");
          },
          onError: (error) {
            print("onError: $error");
            Navigator.pop(context);
          },
          onCancel: () {
            print('cancelled:');
          },
        ),
      ),
    );
  }
}
