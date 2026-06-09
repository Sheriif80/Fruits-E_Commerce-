import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits_e_commerce_app/constants.dart';
import 'package:fruits_e_commerce_app/core/utils/app_snackbars.dart';
import 'package:fruits_e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/cubits/add_order_cubit/add_order_cubit.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/cubits/pay_with_stripe_cubit/pay_with_stripe_cubit.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/checkout_steps.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/checkout_steps_page_view_builder.dart';
import 'package:fruits_e_commerce_app/features/checkout/presentation/views/widgets/custom_checkout_button.dart';
import 'package:fruits_e_commerce_app/generated/l10n.dart';
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
    final s = S.of(context);
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
          BlocListener<PayWithStripeCubit, PayWithStripeState>(
            listener: (context, state) {
              if (state is PayWithStripeSuccess) {
                context.read<AddOrderCubit>().addOrder(
                  orderEntity: context.read<OrderInputEntity>(),
                );

                AppSnackbars.showSuccess(context, message: s.paymentSuccess);
              } else if (state is PayWithStripeError) {
                AppSnackbars.showError(context, message: state.message);
              }
            },
            child: CustomCheckoutButton(
              currentPage: currentPage,
              pageController: pageController,
              formKey: _formKey,
            ),
          ),
          const Gap(25),
        ],
      ),
    );
  }
}
