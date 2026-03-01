import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:fruits_e_commerce_app/features/checkout/domain/entities/order_entity.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key, required this.formKey});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            children: [
              CustomTextFormField(
                hintText: "الاسم كاملاً",
                keyboardType: TextInputType.name,
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddress!.fullName =
                      value!;
                },
              ),
              const Gap(16),
              CustomTextFormField(
                hintText: " البريد الإلكتروني",
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddress!.email = value!;
                },
              ),
              const Gap(16),
              CustomTextFormField(
                hintText: "رقم الهاتف",
                keyboardType: TextInputType.phone,
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddress!.phone = value!;
                },
              ),
              const Gap(16),
              CustomTextFormField(
                hintText: "العنوان",
                keyboardType: TextInputType.streetAddress,
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddress!.address = value!;
                },
              ),
              const Gap(16),
              CustomTextFormField(
                hintText: "المدينة",
                keyboardType: TextInputType.streetAddress,
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddress!.city = value!;
                },
              ),
              const Gap(16),
              CustomTextFormField(
                hintText: "رقم الطابق ,, الشقة",
                keyboardType: TextInputType.streetAddress,
                onSaved: (value) {
                  context.read<OrderEntity>().shippingAddress!.appartment =
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
