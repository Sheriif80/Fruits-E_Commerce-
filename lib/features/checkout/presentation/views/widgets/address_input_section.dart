import 'package:flutter/material.dart';
import 'package:fruits_e_commerce_app/core/widgets/custom_text_form_field.dart';
import 'package:gap/gap.dart';

class AddressInputSection extends StatelessWidget {
  const AddressInputSection({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: const SingleChildScrollView(
        child: Column(
          children: [
            CustomTextFormField(
              hintText: "الاسم كاملاً",
              keyboardType: TextInputType.name,
            ),
            Gap(16),
            CustomTextFormField(
              hintText: " البريد الإلكتروني",
              keyboardType: TextInputType.emailAddress,
            ),
            Gap(16),

            CustomTextFormField(
              hintText: "رقم الهاتف",
              keyboardType: TextInputType.phone,
            ),
            Gap(16),
            CustomTextFormField(
              hintText: "العنوان",
              keyboardType: TextInputType.streetAddress,
            ),
            Gap(16),
            CustomTextFormField(
              hintText: "المدينة",
              keyboardType: TextInputType.streetAddress,
            ),
            Gap(16),
            CustomTextFormField(
              hintText: "رقم الطابق ,, الشقة",
              keyboardType: TextInputType.streetAddress,
            ),
          ],
        ),
      ),
    );
  }
}
