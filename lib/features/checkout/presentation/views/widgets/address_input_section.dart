import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:fruits_e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:fruits_e_commerce_app/generated/l10n.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    final s = S.of(context);
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              CustomTextFormField(
                hintText: s.fullName,
                keyboardType: TextInputType.name,
                onSaved: (value) {
                  context.read<OrderInputEntity>().shippingAddress!.fullName =
                      value!;
                },
              ),
              const Gap(16),
              CustomTextFormField(
                hintText: s.email,
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  context.read<OrderInputEntity>().shippingAddress!.email =
                      value!;
                },
              ),
              const Gap(16),
              CustomTextFormField(
                hintText: s.phone,
                keyboardType: TextInputType.phone,
                onSaved: (value) {
                  context.read<OrderInputEntity>().shippingAddress!.phone =
                      value!;
                },
              ),
              const Gap(16),
              CustomTextFormField(
                hintText: s.address,
                keyboardType: TextInputType.streetAddress,
                onSaved: (value) {
                  context.read<OrderInputEntity>().shippingAddress!.address =
                      value!;
                },
              ),
              const Gap(16),
              CustomTextFormField(
                hintText: s.city,
                keyboardType: TextInputType.streetAddress,
                onSaved: (value) {
                  context.read<OrderInputEntity>().shippingAddress!.city =
                      value!;
                },
              ),
              const Gap(16),
              CustomTextFormField(
                hintText: s.apartment,
                keyboardType: TextInputType.streetAddress,
                onSaved: (value) {
                  context.read<OrderInputEntity>().shippingAddress!.appartment =
                      value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
