import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:fruits_e_commerce_app/core/utils/app_keys.dart';
import 'package:fruits_e_commerce_app/core/utils/app_snackbars.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_button.dart';
import 'package:fruits_e_commerce_app/features/checkout/data/models/payment_intent_input_model.dart';
import 'package:fruits_e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_e_commerce_app/features/checkout/domain/entities/paypal_payment_entity/paypal_payment_entity.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/cubits/add_order_cubit/add_order_cubit.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/cubits/pay_with_stripe_cubit/pay_with_stripe_cubit.dart';
import 'package:fruits_e_commerce_app/generated/l10n.dart';

class CustomCheckoutButton extends StatelessWidget {
  const CustomCheckoutButton({
    super.key,
    required this.currentPage,
    required this.pageController,
    required this.formKey,
  });

  final int currentPage;
  final PageController pageController;
  final GlobalKey<FormState> formKey;
  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return CustomButton(
      text: currentPage == 2
          ? context.read<OrderInputEntity>().payWithCash
                ? s.confirmOrder
                : "الدفع بواسطة حسابك البنكي"
          : s.next,
      onPressed: () async {
        if (currentPage == 1) {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
          } else {
            return;
          }
        }
        if (currentPage == 2) {
          if (context.read<OrderInputEntity>().payWithCash) {
            await context.read<AddOrderCubit>().addOrder(
              orderEntity: context.read<OrderInputEntity>(),
            );
            return;
          } else {
            if (context.read<OrderInputEntity>().payWithCard) {
              _processPayment(context);
              return;
            }
            if (context.read<OrderInputEntity>().payWithStripe) {
              final OrderInputEntity orderEntity = context
                  .read<OrderInputEntity>();
              context.read<PayWithStripeCubit>().payWithStripe(
                paymentIntentInputModel: PaymentIntentInputModel(
                  amount: (orderEntity.cartEntity.calculateTotalPrice() * 100)
                      .toInt()
                      .toString(),
                  currency: 'EGP',
                ),
              );
            }
          }
        }

        pageController.animateToPage(
          currentPage + 1,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      },
    );
  }

  void _processPayment(BuildContext context) {
    final s = S.of(context);
    final OrderInputEntity orderEntity = context.read<OrderInputEntity>();
    final PaypalPaymentEntity payPalPaymentEntity =
        PaypalPaymentEntity.fromEntity(orderEntity);
    final addOrderCubit = context.read<AddOrderCubit>();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => PaypalCheckoutView(
          sandboxMode: true,
          clientId: kPayPalClientID,
          secretKey: kPayPalSecretKey,
          transactions: [payPalPaymentEntity.toJson()],
          note: "Contact us for any questions on your order.",
          onSuccess: (Map params) async {
            log("onSuccess: $params");
            Navigator.pop(context);
            AppSnackbars.showSuccess(context, message: s.paymentSuccess);
            await addOrderCubit.addOrder(orderEntity: orderEntity);
          },
          onError: (error) {
            log("onError: $error");
            Navigator.pop(context);
            AppSnackbars.showError(context, message: s.errorOccurred);
          },
          onCancel: () {
            log('cancelled:');
          },
        ),
      ),
    );
  }
}
